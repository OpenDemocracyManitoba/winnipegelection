class CreateNewsMentions < ActiveRecord::Migration
  def change
    create_table :news_mentions do |t|
      t.text :summary
      t.references :person, index: true
      t.references :news_article, index: true

      t.timestamps
    end

    add_index :news_mentions, [:person_id, :news_article_id], unique: true
  end
end
