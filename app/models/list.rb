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

  def owner_items(pro_con)
    self.items_by_user_id(self.user_id).where(pro_con: pro_con)
  end

  def owner_items_hash
    {
      "pros" => owner_items(true),
      "cons" => owner_items(false)
    }
  end

  def get_contributors
    self.items.pluck(:user_id).uniq - [self.user_id]
  end

  def contributor_items_hash
    hash = {}
    self.get_contributors.each do |id|
      hash[User.find(id)] = {
        "pros" => self.items_by_user_id(id).where(pro_con: true),
        "cons" => self.items_by_user_id(id).where(pro_con: false)
      }
    end
    hash
  end

  def pro_weight_sum

  end

  def con_weight_sum

  end

end
