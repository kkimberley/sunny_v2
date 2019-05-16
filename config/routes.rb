Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :ingredients do
    collection do
      get 'return_ingredients'
    end
  end
  resources :inventories
  resources :ingredient_types
end
