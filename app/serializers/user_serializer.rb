class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :image
  has_many :lists

end
