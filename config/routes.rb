Rails.application.routes.draw do

# <<<<<<< HEAD
  resources :topics do
    resources :posts, except: [:index]
  end


# =======
  resources :questions

  resources :posts
# >>>>>>> assignment-33-RailsMoreCRUD

  get 'about' => 'welcome#about'

  root to: "welcome#index"


end
