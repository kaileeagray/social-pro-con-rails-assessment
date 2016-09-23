class List < ApplicationRecord
  belongs_to :user
  has_many :stars, dependent: :destroy
  has_many :starrers, through: :stars, source: :starrer
  has_many :items, dependent: :destroy

  default_scope -> { order(created_at: :desc) }

  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 80 }
  validates :description, allow_blank: true, length: { maximum: 280 }

  def items_by_user_id(user_id)
    self.items.where(user_id: user_id)
  end

  def owner_items
    self.items_by_user_id(self.user_id)
  end

  def get_contributors
    self.items.pluck(:user_id).uniq - [self.user_id]
  end

  def contributor_items_hash
    hash = {}
    self.get_contributors.each do |id|
      hash[id] = self.items_by_user_id(id)
    end
    hash
  end

end
