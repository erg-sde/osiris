class AddPlantedWeekToBatch < ActiveRecord::Migration[5.2]
  def change
    add_column :batches, :planted_week, :date
  end
end
