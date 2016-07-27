Rails.application.routes.draw do
  root 'restaurants#index'

  resources :restaurants, shallow: true do
    resources :menus do
      collection do
        get :search
        get :search_results
      end
      resources :menu_items do
        collection do
          get :search
          get :search_results
        end
      end
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
