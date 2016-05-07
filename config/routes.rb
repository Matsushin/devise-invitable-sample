Rails.application.routes.draw do

  root to: "home#index"
  resources :teams do
    post :invite, on: :member
  end
  devise_for :users

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: '/letter_opener'
  end
end
