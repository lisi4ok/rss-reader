json.array!(@feeds) do |feed|
  json.extract! feed, :id, :title, :link, :description
  json.url feed_url(feed, format: :json)
end