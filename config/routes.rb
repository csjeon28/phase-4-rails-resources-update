Rails.application.routes.draw do
  resources :birds, only: [:index, :show, :create, :update]
  
  # custom route in order to take off burden of calculating/incrementing likes in frontend
  patch "/birds/:id/like", to: "birds#increment_likes"
end
