Rails.application.routes.draw do
    root 'questions#index'
    get '/signup' => 'users#new'
    get '/edit' => 'users#edit'

    get '/login' => 'sessions#new'
    post '/login' => 'sessions#create'
    delete '/logout' => 'sessions#destroy'

    resources :users
    resources :questions do
        member do
            put "like", to:    "questions#upvote"
            put "dislike", to: "questions#downvote"
        end
        resources :answers
    end

    resources :answers do
        member do
            put "like", to:    "answers#upvote"
            put "dislike", to: "answers#downvote"
         end
    end
end






# another way to include voting routes unlike how i have included for questions
# resources :answers do
#   match "vote", action: :vote, via: [:put,:delete], on: :member
# end

# end








# Rails.application.routes.draw do

#   root 'questions#index'

#   get '/signup' => 'users#new'

#   get '/edit' => 'users#edit'


#     get '/login' => 'sessions#new'
#     post '/login' => 'sessions#create'
#     delete '/logout' => 'sessions#destroy'
 
#     resources :users
#         resources :questions do
#             member do
#                 put "like", to:    "questions#upvote"
#                 put "dislike", to: "questions#downvote"
#             end
#         resources :answers
#         end






# # another way to include voting routes unlike how i have included for questions
# resources :answers do
#   match "vote", action: :vote, via: [:put,:delete], on: :member
# end

# end