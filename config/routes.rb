Rails.application.routes.draw do
  devise_for :players, :controllers => { omniauth_callbacks: "players/omniauth_callbacks", sessions: "players/sessions" }, skip: [:registration]

  resources :boards do
    resources :records do
    end

    member do
      get  'players'
      post 'create_player'
      delete 'destroy_player/:bp_id', to: 'boards#destroy_player', as: 'destroy_player'

      post 'create_game'
    end

    collection do
      get 'search', to: 'boards#search_player', as: 'search_player'
    end
  end

  root 'index#index'
end
