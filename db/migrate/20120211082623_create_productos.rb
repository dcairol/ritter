class CreateProductos < ActiveRecord::Migration
  def change
    create_table :productos do |t|
      t.string :nombre
      t.integer :precio
      t.string :descripcion
      t.references :categoria
      t.has_attached_file :imagen
      t.timestamps
    end
  end
end
