class ChangeProductosDescripcionType < ActiveRecord::Migration
  def up
    change_column :productos,:descripcion,:text
  end

  def down
    change_column :productos,:descripcion,:string
  end
end
