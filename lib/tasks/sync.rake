namespace :sync do
  task feeds: [:environment] do
    require 'open-uri'
    require 'nokogiri'
    Feed.all.each do |feed|
      xmlDoc = Nokogiri::XML(URI.open(feed.link))
      rssItemNodes = xmlDoc.root.xpath("channel/item")
      for index in 0..rssItemNodes.length - 1 do
        item = feed.items.where(link: rssItemNodes[index].at_xpath("link").content).first_or_initialize
        item.link = rssItemNodes[index].at_xpath("link").content
        item.title = rssItemNodes[index].at_xpath("title").content
        item.description = rssItemNodes[index].at_xpath("description").content
        item.date = DateTime.parse(rssItemNodes[index].at_xpath("pubDate").content).strftime("%Y-%m-%d %H:%M:%S")
        item.save
        p "Synced Item - #{item.title}"
      end
      p "Synced Feed - #{feed.title}"
    end
  end
end
