class CreateRegionTypes < ActiveRecord::Migration
  def change
    create_table :region_types do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
