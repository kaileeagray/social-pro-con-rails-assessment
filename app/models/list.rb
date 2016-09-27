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
    hash = {"pros" => {}, "cons" => {}}
    self.get_contributors.each do |id|
      hash["pros"][User.find(id)] = self.items_by_user_id(id).where(pro_con: true)
      hash["cons"][User.find(id)] = self.items_by_user_id(id).where(pro_con: false)
    end
    hash
  end

  def pro_sum
    items.where(pro_con: true).inject(0){|sum,x| sum + x.weight }
  end

  def con_sum
    items.where(pro_con: false).inject(0){|sum,x| sum + x.weight }
  end


  def pro_con_sum
    pro_sum - con_sum
  end

end
