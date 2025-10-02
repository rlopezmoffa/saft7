Rails.application.routes.draw do
  get 'reporte_mantenimiento/index'
  resources :adicionales_choferes
  resources :adicionales_vehiculos
  resources :items_mantenimiento
  resources :servicios_realizados
  resources :administraciones
  get 'vencimientos_documentacion_choferes/index'
  get 'liquidacion_choferes/index'
  get 'resumen_liquidacion_vehiculo/index'
  resources :empresas_choferes  
  get 'configuracion/index'
  get 'liquidacion_vehiculo/index'
  get 'liquidacion_choferes/index'
  get 'vencimientos_documentacion_choferes/index'

  resources :empresas
  resources :vehiculos
  resources :boletas
  resources :choferes
  devise_for :users
  get 'home/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"

  get :liquidacion_vehiculo, :to => 'liquidacion_vehiculo#index'
  get :liquidacion_choferes, :to => 'liquidacion_choferes#index'
  get :vencimientos_documentacion_choferes, :to => 'vencimientos_documentacion_choferes#index'
  get :configuracion, :to => 'configuracion#index'
  get :reporte_mantenimiento, :to => 'reporte_mantenimiento#index'

  resources :liquidacion_vehiculo do
    collection do
      get 'obtiene_detalle_movimientos'
      get 'imprime_reporte'
      get 'servicios_realizados'
    end
  end


end
