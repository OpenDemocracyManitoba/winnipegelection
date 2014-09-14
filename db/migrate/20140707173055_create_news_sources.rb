class CreateNewsSources < ActiveRecord::Migration
  def change
    create_table :news_sources do |t|
      t.string :name
      t.string :base_url

      t.timestamps
    end
  end
end
