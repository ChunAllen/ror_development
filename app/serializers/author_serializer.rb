class AuthorSerializer < ActiveModel::Serializer
  attributes :id, :name #, :reviews

  has_many :books

  # def reviews
  #   "This is the best author"
  # end
end
