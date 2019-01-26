Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'punchlines/index'
      get 'punchlines/create'
      get 'punchlines/update'
      get 'punchlines/edit'
      get 'punchlines/new'
      get 'punchlines/show'
    end
  end
  namespace :api do
    namespace :v1 do
      resources :users do
        collection do
          resource :search, only: :show
        end

        resource :address
      end

      resources :recordings

      devise_for :users
    end
  end
end
