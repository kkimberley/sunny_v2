Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'ingredients#index'
  resources :accounts
  
  resources :ingredients do
    collection do
      get 'return_ingredients'
    end
  end
  resources :inventories do
    collection do
      get 'report'
      get 'quick_report_by_type'
      get 'quick_report_by_month'
    end
  end
  resources :ingredient_types
end
