module PagedScopes
  class Paginator
    attr_reader :page

    def initialize(page)
      @page = page
    end

    def set_path(&block)
      @path = block
    end
    
    def path
      @path || raise(RuntimeError, "No path proc supplied.")
    end

    def previous
      path.call(@page.previous) unless @page.first?
    end

    def next
      path.call(@page.next) unless @page.last?
    end
    
    def first
      path.call(@page.class.first)
    end
    
    def last
      path.call(@page.class.last)
    end

    def window(options)
      raise ArgumentError, "No window block supplied." unless block_given?
      raise ArgumentError, "please specify a :inner option" unless inner = options[:inner]
      return if @page.page_count < 2
      outer = options[:outer] || 0
      extras = [ options[:extras] ].flatten.compact
      numbers = case
      when @page.number <= inner + 1
        1 .. 1 + 2 * inner
      when @page.number >= @page.page_count - inner
        @page.page_count - 2 * inner .. @page.page_count
      else
        @page.number - inner .. @page.number + inner
      end.to_a
      1.upto(outer) { |n| numbers << n << @page.page_count-n+1 }
      numbers.uniq!
      numbers.sort!
      numbers.reject! { |number| !number.between?(1, @page.page_count) }
      returning [] do |results|
        results << yield(:first, @page.first? ? nil : first, []) if extras.include?(:first)
        results << yield(:previous, previous, []) if extras.include?(:previous)
        numbers.zip([nil]+numbers, numbers[1..-1]) do |number, prev_number, next_number|
          page = @page.class.find(number)
          path = page == @page ? nil : @path.call(page)
          classes = []
          classes << :selected if page == @page
          classes << :gap_before if prev_number && prev_number < number - 1
          classes << :gap_after  if next_number && next_number > number + 1
          results << yield(page, path, classes)
        end        
        results << yield(:next, self.next, []) if extras.include?(:next)
        results << yield(:last, @page.last? ? nil : last, []) if extras.include?(:last)
      end.join("\n")
    end
  end
end
