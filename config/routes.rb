Rails.application.routes.draw do
  scope "/:locale" do
    resources :users, only: [:new, :create, :edit, :update]
    resources :sessions, only: [:new, :create, :destroy]
    resources :boards, only: [:index, :new, :create, :edit, :update] do
      resources :posts, only: [:new, :create, :edit, :update, :destroy]
    end
    root 'boards#index'
  end
end
