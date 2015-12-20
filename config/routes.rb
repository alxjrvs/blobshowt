Rails.application.routes.draw do
  namespace :admin do
    resource :broadcast, only: [:index, :new, :create]
  end

  namespace :api do
    namespace :v1 do
      resource :response, only: :create
    end
  end
end
