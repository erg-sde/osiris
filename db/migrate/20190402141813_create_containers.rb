class CreateContainers < ActiveRecord::Migration[5.2]
  def change
    create_table :containers do |t|
      t.string :name
      t.integer :capacity

      t.timestamps
    end
  end
end
