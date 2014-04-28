class Region < ActiveRecord::Base
  belongs_to :region_type, inverse_of: :regions

  # Self-Join For Sub-Regions / Parent Region
  has_many :sub_regions, class_name: 'Region', 
           foreign_key: 'region_id', inverse_of: :parent_region
  belongs_to :parent_region, class_name: 'Region', 
             foreign_key: 'region_id', inverse_of: :sub_regions
end
