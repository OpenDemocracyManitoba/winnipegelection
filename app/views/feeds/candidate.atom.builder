atom_feed do |feed|
  feed.title(@title)

  feed.updated(@updated)

  @mentions.each do |mention|
    feed.entry(mention, :url => mention.news_article.url, :published => mention.news_article.pubdate, :updated => mention.news_article.pubdate) do |entry|
      
      entry.title(h(mention.news_article.title))
      entry.summary mention.summary, :type => 'html'
      
  
      entry.author do |author|
        author.name(mention.news_article.source)
      end
    end
  end
end