class User < ActiveRecord::Base

  # Associations
  has_and_belongs_to_many :genres
  has_many :upvotes
  has_many :bookmarks
  # Below says to give a METHOD bookmarked_apps, look in the TABLE bookmarks,
  # and look at the COLUMN app_id
  has_many :bookmarked_apps, through: :bookmarks, source: :app
  has_many :upvoted_apps, through: :upvotes, source: :app
  has_secure_password

  # Validations
  validates :email, uniqueness: true, presence: true

end
