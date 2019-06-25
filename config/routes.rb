Rails.application.routes.draw do
  scope "/:locale" do
    resources :users, only: [:new, :create]
    resources :sessions, only: [:new]
  end
end
