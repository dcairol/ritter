class Producto < ActiveRecord::Base

	set_table_name 'productos'
	has_attached_file :imagen, 
			  :styles => {:medium => '450x350', :thumb => '75x75'},
			  :storage => :s3,
			  :s3_credentials => "#{Rails.root}/config/s3.yml"

	belongs_to :categoria

	def activo?
		self.activo ? 'Si' : 'No'
	end
end
