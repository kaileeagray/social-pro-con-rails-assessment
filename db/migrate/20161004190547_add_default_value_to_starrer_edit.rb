class AddDefaultValueToStarrerEdit < ActiveRecord::Migration[5.0]
  def change
    change_column :stars, :starrer_edit, :boolean, :default => false
  end
end
