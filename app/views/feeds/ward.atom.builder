atom_feed do |feed|
  feed.title(@title)

  feed.updated(@updated)

  @news_articles.each do |news_article|
    feed.entry(news_article, :url => news_article.url, :published => news_article.pubdate, :updated => news_article.pubdate) do |entry|
      entry.title(h(news_article.title))
      entry.summary(news_article.source + " - Mentions: " + news_article.mentions.map{|m| m.candidate.name}.join(", ") )
      
      entry.author do |author|
        author.name(news_article.source)
      end
    end
  end
end