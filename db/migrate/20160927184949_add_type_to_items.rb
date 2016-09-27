class AddTypeToItems < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :pro_con, :boolean
  end
end
