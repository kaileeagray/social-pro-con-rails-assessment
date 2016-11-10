class ListSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :created_at, :source
  # has_one :user, serializer: ListUserSerializer
  has_one :user
  has_many :lists
end
