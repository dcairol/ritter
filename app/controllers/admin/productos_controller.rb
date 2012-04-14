class Admin::ProductosController < ApplicationController
	layout "application"
	before_filter :authenticate_admin!

	def index
		@categoria = Categoria.find(params[:categoria_id])
		@productos = Producto.find_all_by_categoria_id(@categoria)
		respond_to do |f|
			f.html
			f.js{render :partial => 'productos_by_categoria.js.erb', :locals => {:productos => @productos, :categoria => @categoria }}
		end
	end

	def new
		@categoria = Categoria.find(params[:categoria_id])
		@producto = Producto.new()
		@producto.categoria = @categoria
		render :partial => 'form'
	end

	def edit
		@producto = Producto.find(params[:id])
		@categoria =  @producto.categoria
		render :partial => 'form'
	end

	def update
		@producto = Producto.find(params[:id])
		@producto.update_attributes(params[:producto])
		if !@producto.errors.any?
			flash[:notice] = "El producto #{@producto.nombre} ha sido guardado."
			redirect_to admin_categorias_url
		else
			render :partial => 'form'
		end
	end

	def create
		@producto = Producto.create(params[:producto])
		if !@producto.errors.any?
			flash[:notice] = "El producto #{@producto.nombre} ha sido guardado."
			redirect_to admin_categorias_url
		else
			render :partial => 'form'
		end
	end

	def destroy
		@producto = Producto.find(params[:id])
		@categoria = @producto.categoria
		@productos = @categoria.productos
		@producto.destroy
		respond_to do |f|
			f.html
			f.js{render :partial => 'productos_by_categoria.js.erb'}
		end
	end
end
