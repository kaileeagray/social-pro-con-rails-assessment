class ItemSerializer < ActiveModel::Serializer
  attributes :id, :description, :pro_con, :weight
  has_one :list
  has_one :user
end
