class AddAllCandidatesUrlToImageMaps < ActiveRecord::Migration
  def change
    add_column :image_maps, :all_candidates_url, :string
  end
end
