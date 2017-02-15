Rails.application.routes.draw do
  resources :cats, only: [:index, :show, :new, :create, :edit, :update] do
    resources :cat_rental_requests, only: :index
    post 'cat_rental_requests/approve' => 'cat_rental_requests#approve'
    post 'cat_rental_requests/deny' => 'cat_rental_requests#deny'
  end

  resources :cat_rental_requests, only: [:new, :create]



  root to: "cats#index"
end
