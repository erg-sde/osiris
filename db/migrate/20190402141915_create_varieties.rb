class CreateVarieties < ActiveRecord::Migration[5.2]
  def change
    create_table :varieties do |t|
      t.string :name
      t.integer :price
      t.integer :value
      t.references :container, foreign_key: true

      t.timestamps
    end
  end
end
