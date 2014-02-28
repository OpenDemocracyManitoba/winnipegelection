class Page < ActiveRecord::Base
    def to_param
        "#{id} #{permalink}".parameterize
    end
end
