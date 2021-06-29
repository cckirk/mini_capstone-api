Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # get "/singular_product", controller:"products", action: "one_product"
  # get "/second_product", controller:"products", action: "the_second_product"
  # get "/every_product", controller:"products", action: "all_of_them"
  get "/products", controller: "products", action:"index"
  get "/products/:id", controller: "products", action: "show"
  post "/products/:id", controller: "products", action: "create"
  patch "/products/:id", controller: "products", action: "update"
  delete "/products/:id", controller: "products", action: "destroy"
  #[DELETE] \"/products/3\">"
  #post "/users", controller: "users", action: "create"
  post "/users" => "users#create"
  post "/sessions" => "sessions#create"
  post "/orders" => "orders#create"
  get "/orders" => "orders#show"
end
