Rails.application.routes.draw do
  root to: 'inicio#index' 

  get 'books/new', to: 'books#new'
  post 'books/notes/:id', to: 'books#create'
  get 'books/:id', to:'books#show'
  get 'books/:id/edit', to:'books#edit'
  patch 'books/:id/edit', to:'books#update', as: :book
  delete 'books/:id', to: 'books#destroy', as: :delete
  get 'books/user/:user_id', to: 'books#index'
  
  get 'books/:id/notes/new', to: 'notes#new', as: :new_notes
  post 'books/:id/notes/new', to: 'notes#create', as: :note_create
  patch 'books/:book_id/notes/:id', to: 'notes#update', as: :note_update
  delete 'books/:book_id/notes/:id', to: 'notes#destroy', as: :note_delete

  resources :books do
    resources :notes
  end

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: "users/registrations"
  }
  devise_scope :user do
    post 'users/sign_up', to: 'devise/registrations#create'
end

  get 'inicio', to: 'inicio#index'

 devise_scope :user do
  get '/users/sign_out' => 'devise/sessions#destroy'
   
  end
end
