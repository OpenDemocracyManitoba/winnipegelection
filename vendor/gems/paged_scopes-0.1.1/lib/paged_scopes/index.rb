module PagedScopes
  module Index
    def index_of(object)
      columns = scope(:find, :order).to_s.split(',').map(&:strip) << "#{table_name}.#{primary_key}"
      operators = columns.map do |column|
        column.slice!(/\s+(asc|ASC)$/)
        column.slice!(/\s+(desc|DESC)$/) ? ">" : "<"
      end
      
      attributes = (1..columns.size).map { |n| "attribute_#{n}" }
      
      selects = [ columns, attributes ].transpose.map do |column, attribute|
        "#{column} AS #{attribute}"
      end.unshift("#{table_name}.*").join(', ')
      
      options = { :select => selects }
      options.merge!(:offset => 0) if scope(:find, :limit) && scope(:find, :offset)
      object_with_attributes = find(object.id, options)

      values = attributes.map { |attribute| object_with_attributes.send(attribute) }
      
      string, hash = "", {}
      [ columns, operators, attributes, values ].transpose.reverse.each do |column, operator, attribute, value|
        string = string.blank? ?
          "#{column} #{operator} :#{attribute}" :
          "#{column} #{operator} :#{attribute} OR (#{column} = :#{attribute} AND (#{string}))"
        hash.merge!(attribute.to_sym => value)
      end
      
      options = { :conditions => [ string, hash ], :distinct => true }
      options.merge!(:offset => 0) if scope(:find, :limit) && scope(:find, :offset)
      before_count = count("#{table_name}.#{primary_key}", options)
      
      if scope(:find, :limit)
        before_count -= scope(:find, :offset) if scope(:find, :limit) && scope(:find, :offset)
        raise ActiveRecord::RecordNotFound, "Couldn't find #{name} with ID=#{object.id}" if before_count < 0 || before_count >= scope(:find, :limit)
      end
      
      before_count
    end

    def after(object)
      after_index = index_of(object) + 1
      if limit = scope(:find, :limit)
        after_index >= limit ? nil : first(:offset => after_index + (scope(:find, :offset) || 0))
      else
        first(:offset => after_index)
      end
    end

    def before(object)
      before_index = index_of(object) - 1
      if scope(:find, :limit)
        before_index < 0 ? nil : first(:offset => before_index + (scope(:find, :offset) || 0))
      else
        before_index < 0 ? nil : first(:offset => before_index)
      end
    end
  end
end

ActiveRecord::Base.send :extend, PagedScopes::Index
