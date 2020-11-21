Rails.application.routes.draw do

  scope :api, defaults: { format: :json } do
    devise_for :users, controllers: { sessions: :sessions  , registrations: :registrations},
               path_names: { sign_in: :login }
    resource :order_items, only: [:create]
    resource :menus, only: [:show , :create]
    post 'orders/update_order_status'
    post 'orders/cancel_order'
    post 'orders/update_payment_status'
  end
  resource :user, only: [:show, :update]
end
