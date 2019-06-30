Rails.application.routes.draw do
  scope "/:locale" do
    resources :users, only: [:new, :create, :edit, :update]
    resources :sessions, only: [:new, :create, :destroy]
    resources :boards, only: [:index, :new, :create] do
      resources :posts, only: [:new, :create]
    end
  end
end
