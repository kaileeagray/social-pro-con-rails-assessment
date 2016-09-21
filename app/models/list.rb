class List < ApplicationRecord
  belongs_to :user
  has_many :stars, dependent: :destroy
  has_many :starrers, through: :stars, source: :starrer

  default_scope -> { order(created_at: :desc) }

  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 80 }
  validates :description, allow_blank: true, length: { maximum: 280 }

end
