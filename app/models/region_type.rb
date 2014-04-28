class RegionType < ActiveRecord::Base
  has_many :regions, inverse_of: :region_type
end
