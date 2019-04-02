class RemoveValueFromVariety < ActiveRecord::Migration[5.2]
  def change
    remove_column :varieties, :value, :integer
  end
end
