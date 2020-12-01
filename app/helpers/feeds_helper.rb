module FeedsHelper

  def get_rss_feed_info(url)
    require 'rss'
    require 'open-uri'
    rss = RSS::Parser.parse(open(url).read, false)
    return {
      title: rss.channel.title,
      link: rss.channel.link,
      description: rss.channel.title
    }
  end

  def get_rss_feed_items(url)
    require 'rss'
    require 'open-uri'
    rss = RSS::Parser.parse(open(url).read, false).channel.items
    items = []
    rss.each do |result|
      items << {
        title: result.title,
        link: result.link,
        description: result.description,
        date: result.pubDate.strftime("%Y-%m-%d %H:%M:%S")
      }
    end
    return items
  end

end
