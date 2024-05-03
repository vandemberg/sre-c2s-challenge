Rails.application.routes.draw do
  resources :leads

  namespace :api do
    namespace :v1 do
      resources :leads
    end
  end
  root "leads#index"
end
