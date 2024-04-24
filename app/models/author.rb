class Author < ApplicationRecord
  has_many :books, dependent: :restrict_with_error

  validates :name, presence: true, uniqueness: { case_sensitive: false }

  # To Add DB uniquness constraint 
  # create a migration file using rails g migration <migration_name>
  # add_index :posts, :user_id, unique: true
  # rake db:migrate
end
