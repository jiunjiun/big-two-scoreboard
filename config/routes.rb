Rails.application.routes.draw do
  devise_for :players, :controllers => { omniauth_callbacks: "players/omniauth_callbacks", sessions: "players/sessions" }, skip: [:registration]

  resources :boards do
    resources :records
  end

  root 'index#index'
end
