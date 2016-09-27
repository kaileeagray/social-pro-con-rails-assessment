class AddWeightToItems < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :weight, :integer
  end
end
