Rails.application.routes.draw do
  scope "/:locale" do
    resources :users, only: [:new, :create, :edit, :update]
    resources :sessions, only: [:new, :create, :destroy]
    resources :boards, only: [:index, :new, :create, :edit, :update, :destroy] do
      resources :posts, only: [:new, :create, :edit, :update, :destroy]
    end
    resources :records, param: :id do
      resources :active_storage_attachments, only: [:destroy]
    end
    root 'boards#index'
  end
end
