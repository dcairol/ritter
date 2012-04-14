class RemovePrecioFromProducto < ActiveRecord::Migration
  def up
    remove_column :productos,:precio
  end

  def down
    add_column :productos,:precio,:integer
  end
end
