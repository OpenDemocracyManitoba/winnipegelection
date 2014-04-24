class CreateRegions < ActiveRecord::Migration
  def change
    create_table :regions do |t|
      t.string :name
      t.datetime :start_date
      t.datetime :end_date
      t.references :region_type, index: true
      t.references :region, index: true

      t.timestamps
    end
  end
end
