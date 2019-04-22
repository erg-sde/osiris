class AddPppToVariety < ActiveRecord::Migration[5.2]
  def change
    add_column :varieties, :ppp, :string
  end
end
