class App < ActiveRecord::Base

  # Associations
  has_and_belongs_to_many :genres
  has_many :upvotes
  has_many :bookmarks
  # Below says to give a METHOD upvoting_users, look in the TABLE upvotes,
  # and look at the COLUMN user_id
  has_many :upvoting_users, through: :upvotes, source: :user
  has_many :bookmarking_users, through: :bookmarks, source: :user

  # Validations
  validates :itunes_id, :track_view_url, :uniqueness => true
  validates :creator, :description, :itunes_id, :large_avatar_url,
  :name, :price, :screenshot_urls, :small_avatar_url,
  :tags, :track_view_url, :presence => true

  # Callbacks

  # Scopes
  scope :top_this_week,   ->(limit, offset = 0) {
                                joins(:upvotes).
                                select('apps.*, count(upvotes.id) as upvotes_count').
                                where(:'upvotes.created_at' => 1.week.ago..DateTime.now).
                                group("upvotes.app_id,apps.#{self.column_names.join(',apps.')}").
                                order('upvotes_count DESC').
                                limit(limit).
                                offset(offset)
                              }

  scope :top_this_month,  ->(limit, offset = 0) {
                                joins(:upvotes).
                                select('apps.*, count(upvotes.id) as upvotes_count').
                                where(:'upvotes.created_at' => 1.month.ago..DateTime.now).
                                group("upvotes.app_id,apps.#{self.column_names.join(',apps.')}").
                                order('upvotes_count DESC').
                                limit(limit).
                                offset(offset)
                              }

  # Custom methods
  def add_genres
    self.tags.split(',').each do |tag|
      genre = Genre.find_by(name: tag.downcase)
      self.genres << genre if genre
    end
  end

  def upvote_count
    Upvote.where(app_id: self.id).count
  end

end
