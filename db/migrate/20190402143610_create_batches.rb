class CreateBatches < ActiveRecord::Migration[5.2]
  def change
    create_table :batches do |t|
      t.references :variety, foreign_key: true
      t.integer :quantity
      t.references :container, foreign_key: true
      t.string :stage
      t.references :location, foreign_key: true
      t.string :treatment
      t.string :soil

      t.timestamps
    end
  end
end
