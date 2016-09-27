class Item < ApplicationRecord
  belongs_to :list
  belongs_to :user
  TYPE = { 1 => "pro", 0 => "con"}

  

end
