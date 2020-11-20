Rails.application.routes.draw do
  scope :api, defaults: { format: :json } do
    devise_for :users,controllers: { sessions: :sessions ,registrations: :registrations},
               path_names: { sign_in: :login }
  end
  resource :user, only: [:show, :update]
  resource :menus, only: [:show , :create]
end
