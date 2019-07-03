Rails.application.routes.draw do
  get '/', to: 'boards#index'
  scope "/:locale" do
    resources :users, only: [:new, :create, :edit, :update] do
      resources :labels, only: [:index, :new, :create, :edit, :update, :destroy]
    end
    resources :sessions, only: [:new, :create, :destroy]
    resources :boards, only: [:index, :new, :create, :edit, :update, :destroy] do
      resources :posts, only: [:new, :create, :edit, :update, :destroy]
    end
    root 'boards#index'
  end
end
