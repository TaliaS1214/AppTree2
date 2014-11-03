class User < ActiveRecord::Base

  # Associations
  has_and_belongs_to_many :genres
  has_many :upvotes
  has_many :bookmarks
  # Below says to give a METHOD upvoted_apps, look in the TABLE upvotes,
  # and look at the COLUMN app_id
  has_many :upvoted_apps, through: :upvotes, source: :app, class_name: "App"
  #has_many :bookmarked_apps, through: :bookmarks, source: :app
  has_secure_password

  # Validations
  validates :email, uniqueness: true, presence: true

  def upvote_app(app)
    Upvote.create!({
        user_id: self.id,
        app_id: app.id
    })
  end

  def downvote_app(app)
    Upvote.where({
      user_id: self.id,
      app_id: app.id
    }).first.destroy
  end

end
