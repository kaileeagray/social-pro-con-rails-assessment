class List < ApplicationRecord
  include ActiveModel::Serialization

  belongs_to :user
  has_many :stars, dependent: :destroy
  has_many :starrers, through: :stars, source: :starrer
  has_many :items, dependent: :destroy

  default_scope -> { order(created_at: :desc) }

  validates :title, presence: true, length: { maximum: 80 }
  validates :description, allow_blank: true, length: { maximum: 280 }

  def items_attributes=(items_attributes)
    items_attributes.each do |i, item_attributes|
      if item_attributes[:id] && self.items.find(item_attributes[:id])
        self.items.find(item_attributes[:id]).update(item_attributes)
      else
        self.items.build(item_attributes)
      end
    end
  end

  def update_admins(user_ids)
    user_ids.each do |user_id|
      star = Star.find_by(list_id: self.id, starrer_id: user_id.to_i)
      star.update(admin: true)
    end
  end

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
      hash["pros"][User.find(id)] = self.items_by_user_id(id).where(pro_con: true) unless self.items_by_user_id(id).where(pro_con: true).empty?
      hash["cons"][User.find(id)] = self.items_by_user_id(id).where(pro_con: false) unless self.items_by_user_id(id).where(pro_con: false).empty?
    end
    hash
  end

  def pros
    items.where(pro_con: true)
  end

  def cons
    items.where(pro_con: false)
  end

  def pro_sum
    pros.inject(0){|sum,x| sum + x.weight }
  end

  def con_sum
    cons.inject(0){|sum,x| sum + x.weight }
  end


  def pro_con_sum
    pro_sum - con_sum
  end

  def admins
    ids = stars.where(admin: true).pluck(:starrer_id)
    User.where(id: ids)
  end

  def admin?(user)
    admins.include?(user)
  end

end
