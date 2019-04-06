class AddShipWeekToLineItem < ActiveRecord::Migration[5.2]
  def change
    add_column :line_items, :ship_week, :integer
  end
end
