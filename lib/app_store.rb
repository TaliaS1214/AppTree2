module AppStore

  def self.search(term)
    results = JSON.parse(HTTParty.get(URI.escape(search_url(term))))['results']
    results.map { |app| grab_necessary_data(app) }
  end

  def self.search_url(term)
    "https://itunes.apple.com/search?term=#{term}&entity=software"
  end

  def self.grab_necessary_data(json_app)
    {
      itunes_id:        json_app['trackId'],
      name:             json_app['trackName'],
      tags:             json_app['genres'].join(','),
      screenshot_urls:  json_app['screenshotUrls'].join(','),
      release_date:     DateTime.parse(json_app['releaseDate']).strftime('%m/%d/%Y'),
      creator:          json_app['artistName'],
      price:            json_app['price'],
      small_avatar_url: json_app['artworkUrl60'],
      large_avatar_url: json_app['artworkUrl512'],
      track_view_url:   json_app['trackViewUrl'],
      description:      json_app['description']
    }
  end

end
