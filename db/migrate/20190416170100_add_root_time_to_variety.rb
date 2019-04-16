class AddRootTimeToVariety < ActiveRecord::Migration[5.2]
  def change
    add_column :varieties, :root_time, :integer
  end
end
