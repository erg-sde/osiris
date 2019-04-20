class AddPlantIdToVariety < ActiveRecord::Migration[5.2]
  def change
    add_column :varieties, :plant_id, :string
  end
end
