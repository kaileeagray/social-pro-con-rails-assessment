class AddAccessToStars < ActiveRecord::Migration[5.0]
  def change
    add_column :stars, :starrer_edit, :boolean
  end
end
