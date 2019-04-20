class AddDifficultyToVariety < ActiveRecord::Migration[5.2]
  def change
    add_column :varieties, :difficulty, :int
  end
end
