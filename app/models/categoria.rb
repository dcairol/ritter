class Categoria < ActiveRecord::Base

	set_table_name 'categorias'
	validates_presence_of :nombre, :message => "Indique un nombre."
	validates_uniqueness_of :nombre, :message => "Este nombre ya fue tomado para otra categoria."
	has_many :productos
end
