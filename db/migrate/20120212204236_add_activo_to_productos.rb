class AddActivoToProductos < ActiveRecord::Migration
  def change
    add_column :productos, :activo, :boolean
  end
end
