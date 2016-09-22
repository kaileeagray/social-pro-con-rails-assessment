class List < ApplicationRecord
  belongs_to :user
  has_many :stars, dependent: :destroy
  has_many :starrers, through: :stars, source: :starrer
  has_many :items, dependent: :destroy

  default_scope -> { order(created_at: :desc) }

  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 80 }
  validates :description, allow_blank: true, length: { maximum: 280 }

  def owner_items
    self.items.where(user_id: self.user_id)
  end

  def contributors_items
    self.items.where(user_id: get_contributors)
  end

  def get_contributors
    self.items.pluck(:user_id).uniq - [self.user_id]
  end

  def contributor_items(user_id)
    contributors_items.where(user_id: user_id)
  end

  def contributor_items_hash
  end

end
