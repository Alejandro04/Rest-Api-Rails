Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace 'api' do
    namespace 'v1' do
      resources :articles
      resources :categories
      resources :subcategories
      get '/categories/subcategories/:id', to: 'categories#subcategories'
      get '/categories/articles/:id', to: 'categories#articles'
      get '/articles/category/:id', to: 'articles#category'
    end
  end
end
