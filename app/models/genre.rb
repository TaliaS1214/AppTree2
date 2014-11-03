class Genre < ActiveRecord::Base
  # Associations
  has_and_belongs_to_many :apps

  # Validations
  validates :name, uniqueness: :true, presence: true

end
