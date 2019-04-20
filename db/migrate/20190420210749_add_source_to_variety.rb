class AddSourceToVariety < ActiveRecord::Migration[5.2]
  def change
    add_column :varieties, :source, :string
  end
end
