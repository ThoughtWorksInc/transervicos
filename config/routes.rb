Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  scope(path_names: { new: 'novo', edit: 'editar' }) do
    resources :services, path: 'servicos'
  end

  get 'dashboard' => 'dashboard#index', :path => 'meu-perfil'

  get 'area/:area_id/subareas' => 'application#load_subareas', :as => 'subareas', :format => :json

  devise_for :users, controllers: { registrations: 'registrations' }

  root 'welcome#index'
end
