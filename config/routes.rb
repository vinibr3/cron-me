Rails.application.routes.draw do
  scope "/:locale" do
    resources :users, only: [:new, :create, :show]
    resources :sessions, only: [:new, :create]
  end
end
