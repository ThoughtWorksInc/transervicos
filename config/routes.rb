Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  mount HealthMonitor::Engine, at: '/'

  scope(path_names: { new: 'novo', edit: 'editar' }) do
    resources :services, path: 'servicos' do
      member do
        put 'like', to: 'services#upvote'
        put 'dislike', to: 'services#downvote'
      end
    end
  end

  get 'dashboard' => 'dashboard#index', path: 'meu-perfil'

  get 'state/:id' => 'states#show', format: 'json'

  get 'area/:area_id/subareas' => 'application#load_subareas', as: 'subareas', :format => :json

  devise_for :users, controllers: { registrations: 'registrations' }

  root 'welcome#index'

  match '/404' => 'errors#not_found', :via => :all
  match '/422' => 'errors#unacceptable', :via => :all
  match '/500' => 'errors#internal_error', :via => :all
end
