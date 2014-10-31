class App < ActiveRecord::Base

  # Associations
  has_and_belongs_to_many :genres
  has_many :upvotes
  has_many :bookmarks
  # Below says to give a METHOD bookmarked_apps, look in the TABLE bookmarks,
  # and look at the COLUMN user_id
  has_many :bookmarking_users, through: :bookmarks, source: :user
  has_many :upvoting_users, through: :upvotes, source: :user

  # Validations
  validates :itunes_id, :track_view_url, :uniqueness => true
  validates :creator, :description, :itunes_id, :large_avatar_url,
  :name, :price, :screenshot_urls, :small_avatar_url,
  :tags, :track_view_url, :presence => true

  # Callbacks
  before_create :set_initial_data

  # Custom methods
  def add_genres
    self.tags.split(',').each do |tag|
      genre = Genre.find_by(name: tag.downcase)
      self.genres << genre if genre
    end
  end

  def set_initial_data
    self.upvote_count = 0
    self.popularity_score = 0
  end

end
