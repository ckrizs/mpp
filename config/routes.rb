Rails.application.routes.draw do
  namespace :doctors do
    resources :patients, only: [] do
      resource :dashboard, only: [:show]
      resources :patient_cards, only: [:new, :create, :edit, :update]
    end
    resource :dashboard, only: [:show]
    resource :profile, only: [:edit, :update]
    resources :appointments, only: [:update]
  end

  resources :patients, only: [] do
    resources :appointments, only: [:new, :create]
    resource :dashboard, only: [:show]
  end

  namespace :patients do
    resource :dashboard, only: [:show] do
      resources :appointments, only: [:create]
    end
    resource :profile, only: [:edit, :update]
    resources :patient_cards, only: [:new, :create, :edit, :update]
  end

  devise_for :doctors, controllers: { registrations: 'doctors/registrations', sessions: 'doctors/sessions', confirmations: 'doctors/confirmations' }
  devise_for :patients, controllers: { registrations: 'patients/registrations', sessions: 'patients/sessions', confirmations: 'patients/confirmations' }

  root "home#index"
  get "up" => "rails/health#show", as: :rails_health_check
end