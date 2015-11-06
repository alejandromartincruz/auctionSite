Rails.application.routes.draw do
  resources :users do
  	resources :products
  end

  get "/" => "sites#index"
  get "/details/:id" => "sites#show", as: "details"
end
