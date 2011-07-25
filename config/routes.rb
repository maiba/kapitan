Kapitan::Application.routes.draw do

  devise_for :accounts,
    :path_names => {
      :sign_in => 'login',
      :sign_out => 'logout',
      :sign_up => 'registration'
    },
    :controllers => {
      :sessions => 'accounts/sessions',
      :registrations => 'accounts/registrations',
      :passwords => 'accounts/passwords'
    }

  resources :account_attachments

  namespace :admin do
    resources :accounts
  end

  namespace :cabinet do
    root :to => 'home#index'
  end

  resources :ads, :only => [:index, :show] do
    get :random, :on => :collection
  end

  resources :news_items, :only => [:index, :show], :path => 'news'

  resources :articles, :only => [:index, :show]

  resources :services, :only => [:index, :show] do
    resources :offer_groups, :only => [:show], :controller => 'service/offer_groups'
  end

  resources :cart, :only => [:create, :destroy]

  get :calculator, :to => 'calculator#index'
  get 'calculator/offers', :to => 'calculator#offers'
  get 'calculator/properties', :to => 'calculator#properties'

  resource :order, :controller => 'order'

  scope :path => 'refinery', :as => 'admin', :module => 'admin' do
    get 'news_items/parse_news', :to => 'news_items#parse_news'

    resources :ads, :except => :show do
      post :update_positions, :on => :collection
    end
    resources :articles, :except => :show do
      post :update_positions, :on => :collection
    end
    resources :news_items, :except => :show do
      post :update_positions, :on => :collection
    end
    resources :offers, :except => :show do
      post :update_positions, :on => :collection
    end
    resources :offer_groups, :except => :show do
      post :update_positions, :on => :collection
    end
    resources :services, :except => :show do
      post :update_positions, :on => :collection
    end
    resources :service_packages, :except => :show do
      post :update_positions, :on => :collection
    end
  end

end
