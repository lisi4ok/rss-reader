feeds = Feed.create([
  {
    url: "http://www.ruby-lang.org/en/feeds/news.rss",
    title: "Ruby News",
    link: "https://www.ruby-lang.org/en/feeds/news.rss",
    description: "The latest news from ruby-lang.org."
  },
  {
    url: "http://feeds.feedburner.com/CoinDesk?format=xml",
    title: "CoinDesk",
    link: "https://www.coindesk.com",
    description: "Leader in crypto and blockchain news and information."
  },
  {
    url: "https://medium.com/feed/@krandles",
    title: "Stories by Kevin Randles on Medium",
    link: "https://medium.com/feed/@krandles",
    description: "Stories by Kevin Randles on Medium"
  }
])
