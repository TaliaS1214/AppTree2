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
  validates :itunes_id, uniqueness: true


end
