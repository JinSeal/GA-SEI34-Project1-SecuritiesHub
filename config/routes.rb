Rails.application.routes.draw do

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

    root :to => 'users#show'

    resources :users

    get '/login' => 'session#new', :as => 'login'
    post '/login' =>  'session#create'
    delete '/login' => 'session#destroy'

    resources :portfolios

    resources :transactions, :only => [ 'create', 'index']
    get 'transactions/:symbol' => "transactions#new", :as => 'newtransaction'

    resources :watchlists, :except => [:show]
    get 'watchlists/:symbol' => "watchlists#index"
    resources :friendships, :except => [:new, :edit, :update]
    get 'friendships/:id/following' => 'friendships#following', :as => "following"
    get 'friendships/:id/followed' => 'friendships#followed', :as => "followed"

    resources :posts, :except => [:update]
    post 'posts/:id' => 'posts#update'


end
