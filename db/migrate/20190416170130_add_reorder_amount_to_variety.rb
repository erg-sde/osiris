class AddReorderAmountToVariety < ActiveRecord::Migration[5.2]
  def change
    add_column :varieties, :reorder_amount, :integer
  end
end
