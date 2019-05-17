Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'ingredients#index'
  resources :ingredients do
    collection do
      get 'return_ingredients'
    end
  end
  resources :inventories do
    collection do
      get 'report'
      get 'quick_report'
    end
  end
  resources :ingredient_types
end
