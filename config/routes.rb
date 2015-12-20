Rails.application.routes.draw do
  namespace :admin do
    resource :broadcasts, only: [:index, :new, :create]
  end

  namespace :api do
    namespace :v1 do
      resource :responses, only: :create
    end
  end
end
