class ItemSerializer < ActiveModel::Serializer
  attributes :id, :description, :pro_con, :weight
  belongs_to :user
  belongs_to :list
end
