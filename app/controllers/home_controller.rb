class HomeController < ApplicationController

  def index
    @categorias = Categoria.all
  end

  def productos_por_categoria
    @categoria = Categoria.find(params[:id])
    respond_to do |format|
      format.js
    end
  end
end
