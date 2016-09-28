class Item < ApplicationRecord
  belongs_to :list
  belongs_to :user
  TYPE = { 1 => "pro", 0 => "con"}

  def pro_con_name
    self.pro_con ?
    "pro" : "con"
  end
end
