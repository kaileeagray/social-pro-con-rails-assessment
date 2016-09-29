class Item < ApplicationRecord
  belongs_to :list
  belongs_to :user

  validates :description, :presence => true, :allow_blank => true
  validates :list_id, :presence => true, :allow_blank => true

  TYPE = { 1 => "pro", 0 => "con"}

  def pro_con_name
    self.pro_con ?
    "pro" : "con"
  end
end
