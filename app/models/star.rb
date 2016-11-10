class Star < ApplicationRecord
  include ActiveModel::Serialization

  belongs_to :list
  belongs_to :starrer, class_name: "User"

  validates :list_id, presence: true
  validates :starrer_id, presence: true

end
