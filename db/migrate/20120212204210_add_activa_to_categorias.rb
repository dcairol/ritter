class AddActivaToCategorias < ActiveRecord::Migration
  def change
    add_column :categorias, :activa, :boolean
  end
end
