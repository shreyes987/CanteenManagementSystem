Rails.application.routes.draw do
  scope :api, defaults: { format: :json } do
    devise_for :users,controllers: { sessions: :sessions ,registrations: :registrations},
               path_names: { sign_in: :login }
  end
  post 'orders/update_order_status'
  post 'orders/update_payment_status'
  post 'orders/cancel_order'
  resource :order_items, only: [:show , :create]
  resource :user, only: [:show, :update]
  resource :menus, only: [:show , :create]
end
