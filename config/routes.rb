Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  mount HealthMonitor::Engine, at: '/'

  scope(path_names: { new: 'novo', edit: 'editar' }) do
    resources :services, path: 'servicos'
  end

  get 'dashboard' => 'dashboard#index', path: 'meu-perfil'

  get 'state/:id' => 'states#show', format: 'json'

  get 'area/:area_id/subareas' => 'application#load_subareas', as: 'subareas', :format => :json

  devise_for :users, controllers: { registrations: 'registrations' }

  root 'welcome#index'

  get '/404' => 'errors#not_found'
  get '/422' => 'errors#unacceptable'
  get '/500' => 'errors#internal_error'
end
