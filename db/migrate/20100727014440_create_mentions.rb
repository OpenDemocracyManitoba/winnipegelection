class CreateMentions < ActiveRecord::Migration
  def self.up
    create_table :mentions do |t|
      t.integer :candidate_id
      t.integer :news_article_id
      t.text :summary

      t.timestamps
    end
  end

  def self.down
    drop_table :mentions
  end
end
