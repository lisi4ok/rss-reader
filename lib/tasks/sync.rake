namespace :sync do
  task feeds: [:environment] do
    require 'open-uri'
    require 'rss'
    #require 'nokogiri'
    #require 'feedjira'
    Feed.all.each do |feed|
      items = RSS::Parser.parse(URI.open(feed.link).read, false).channel.items
      items.each do |item|
        model = feed.items.where(link: item.link).first_or_initialize
        model.title = item.title
        model.description = item.description
        model.date = item.pubDate.strftime("%Y-%m-%d %H:%M:%S")
        model.save
        p "Synced Item - #{model.title}"
      end
      p "Synced Feed - #{feed.title}"





      # feed = Feedjira.parse(URI.open(feed.link).read)
      # feed.entries.each do |entry|
      #   item = feed.items.where(title: entry.title).first_or_initialize
      #   item.update_attributes(description: entry.content, link: entry.url, date: entry.published)
      #   p "Synced Item - #{entry.title}"
      # end
      # p "Synced Feed - #{feed.title}"




      # xmlDoc = Nokogiri::XML(URI.open(feed.link))
      # rssItemNodes = xmlDoc.root.xpath("channel/item")
      # for index in 0..rssItemNodes.length - 1 do
      #   item = feed.items.where(link: rssItemNodes[index].at_xpath("link").content).first_or_initialize
      #   item.link = rssItemNodes[index].at_xpath("link").content
      #   item.title = rssItemNodes[index].at_xpath("title").content
      #   item.description = rssItemNodes[index].at_xpath("description").content
      #   item.date = DateTime.parse(rssItemNodes[index].at_xpath("pubDate").content).strftime("%Y-%m-%d %H:%M:%S")
      #   item.save
      #   p "Synced Item - #{item.title}"
      # end
      # p "Synced Feed - #{feed.title}"
    end
  end
end
