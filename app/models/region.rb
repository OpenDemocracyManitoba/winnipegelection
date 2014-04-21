class Region < ActiveRecord::Base
  belongs_to :region_type
  belongs_to :region_id
end
