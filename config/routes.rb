Rails.application.routes.draw do

  
  

  root 'questions#index'

  

  get '/signup' => 'users#new'

  get '/edit' => 'users#edit'


get '/login' => 'sessions#new'
post '/login' => 'sessions#create'
delete '/logout' => 'sessions#destroy'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
    resources :users
    resources :questions do
      member do
      put "like", to:    "questions#upvote"
      put "dislike", to: "questions#downvote"
    end
      resources :answers
    end






# another way to include voting routes unlike how i have included for questions
resources :answers do
  match "vote", action: :vote, via: [:put,:delete], on: :member
end

end
