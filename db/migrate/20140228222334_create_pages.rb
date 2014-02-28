class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :title
      t.text :content
      t.string :permalink
      t.boolean :show_title

      t.timestamps
    end
  end
end
