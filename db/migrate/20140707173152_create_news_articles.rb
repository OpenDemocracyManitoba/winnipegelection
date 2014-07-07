class CreateNewsArticles < ActiveRecord::Migration
  def change
    create_table :news_articles do |t|
      t.string :title
      t.datetime :publication_date
      t.string :google_news_url
      t.string :url
      t.string :moderation
      t.text :rejection_reason
      t.references :news_source, index: true

      t.timestamps
    end
  end
end
