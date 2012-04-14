Ritter::Application.routes.draw do

  root :to => 'home#index'
  devise_for :admins, :path => "admin",:controllers => {:sessions => "admin/sessions"}

  devise_scope :admin do
	match "/admin" => "admin/sessions#new"
        root :to => "admin/categorias#index"
  end

  namespace :admin do
	resources :admins
	resources :categorias do
		resources :productos
	end
  end
  match 'categorias/cancelar' => 'admin/categorias#cancel', :as => :cancel_categoria
  match 'productos/:id/delete' => 'admin/productos#destroy', :as => :delete_producto
  match 'categorias/:id/productos' => 'home#productos_por_categoria', :as => 'productos_por_categoria'
  match 'products/:id' => 'home#ver_producto', :as => 'ver_producto'
end
