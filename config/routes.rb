Rails.application.routes.draw do


  resources :work_orders
  resources :companies
  resources :vendors
  #comfy_route :cms_admin, :path => '/admin'
  mount RailsEmailPreview::Engine, at: 'emails'
  resources :agreements
  resources :consultants
  resources :profiles
  resources :matters, :tasks, :issues, :trainings, :users, :offices do
    resources :comments, :attachments, :tasks, :issues
  end

  resources :job_titles, :business_units, :profit_centers, :departments, :divisions, :functions, :locations, :segments do
    resources :comments, :attachments, :tasks, :issues
  end


  resources :regulators
  resources :chat_rooms, only: [:new, :create, :show, :index]
  resources :friendships, only: [:create, :update, :destroy]

  mount ActionCable.server => '/cable'

  get 'activities/index'
  resources :public_activities
  get 'attestation/:policy_attestation_id', to: 'attestations#show', as: 'attestation_path'
  get 'taskable/:taskable_type/:taskable_id/tasks', to: 'tasks#index', as: 'taskable_tasks_path'
  get 'taskable/:taskable_type/:taskable_id/task_board', to: 'tasks#task_board', as: 'taskable_task_board_path'
  get 'activities/index', as: :public_activity_orm_active_record_activity_comment_path
  get 'tasks/task_board', to: 'tasks#task_board'
  get 'entries/index'

  post 'users/:item/:role/:user', to: 'users#role', as: 'user_role_path'

  post 'matters/:id', to: 'matters#update', as: 'update_matter_tasks_path'

  post 'user_assignments/:id/:role', to: 'user_assignments#update', as: 'update_user_role_path'
  delete 'user_assignments/:id', to: 'user_assignments#destroy', as: 'destroy_user_role_path'

  post 'training_users/:id/:role', to: 'training_users#update', as: 'update_training_user_role_path'
  delete 'training_users/:id', to: 'training_users#destroy', as: 'destroy_training_user_role_path'


  post 'follow/:item/', to: 'follows#create', as: 'item_follow_path'
  delete 'unfollow/:item', to: 'follows#destroy', as: 'item_unfollow_path'
  get 'entries/show'
  get "rss_feeds/update_feeds"
  resources :entries, only: [:index, :show]
  # notify_to :users, controller: 'users/notifications'

  notify_to :users, with_devise: :users

  resources :rss_feeds do
    member do
     resources :entries, only: [:index, :show]
    end
  end
  devise_for :user, skip: [:sessions]

  # devise_for :user, controllers: {
  #   confirmations: 'devise/confirmations',
  #   passwords: 'devise/passwords',
  #   registrations: 'devise/registrations',
  #   sessions: 'devise/sessions',
  #   unlocks: 'devise/unlocks',
  # }, skip: [:sessions]

  # devise_for :user

  # custom routes for users
  as :user do
    get 'login' => 'devise/sessions#new', as: :new_user_session
    post 'login' => 'devise/sessions#create', as: :user_session
    # delete 'logout' => 'devise/sessions#destroy', as: :destroy_user_session
    get 'logout' => 'devise/sessions#destroy', as: :destroy_user_session
    get 'register' => 'devise/registrations#new'
    # root to: "devise/sessions#new"
  end

  resources :terminations

  unauthenticated do
   root :to => 'devise/sessions#new'
  end

  authenticated do
    root :to => 'matters#index'
  end

  resources :attachments, able: 'attachable'
  resources :comments, able: 'commentable'

  resources :policies


  # get 'user/show'
  root to: 'home#home'




end
