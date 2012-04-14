class Admin::CategoriasController < ApplicationController

	before_filter :authenticate_admin!

	def index
		@categorias = Categoria.all
	end
	
	def new
		@categoria = Categoria.new
		respond_to do |f|
			f.html
			f.js{render :partial => "new.js.erb"}
		end
	end

	def create		
		@categoria = Categoria.create(params[:categoria])
		if @categoria.errors.empty?
			flash[:notice] = "La categoria #{@categoria.nombre} ha sido salvada."
			respond_to do |f|
				f.html
				f.js{render :partial => "refresh_categorias.js.erb", :locals => {:categorias => Categoria.all}}
			end
		else
			respond_to do |f|
				f.html
				f.js{render :partial => "new.js.erb"}
			end	
		end
	end
	
	def destroy
		@categoria = Categoria.find(params[:id])
		flash[:notice] = "La categoria #{@categoria.nombre} ha sido borrada."
		@categoria.destroy
		respond_to do |f|
			f.html
			f.js{render :partial => "refresh_categorias.js.erb", :locals => {:categorias => Categoria.all}}
		end
	end

	def edit
		@categoria = Categoria.find(params[:id])
		respond_to do |f|
			f.html
			f.js{render :partial => 'edit.js.erb'}
		end
	end

	def update
		@categoria = Categoria.find(params[:id])
		@categoria.update_attributes(params[:categoria])
		if @categoria.save
			flash[:notice] = "La categoria #{@categoria.nombre} ha sido salvada."
			respond_to do |f|
				f.html
				f.js{render :partial => "refresh_categorias.js.erb", :locals => {:categorias => Categoria.all}}
			end
		else
			respond_to do |f|
				f.html
				f.js{render :partial => "edit.js.erb"}
			end	
		end
	end

	def cancel
		respond_to do |f|
			f.html
			f.js{render :partial => "refresh_categorias.js.erb", :locals => {:categorias => Categoria.all}}
		end
	end
end
