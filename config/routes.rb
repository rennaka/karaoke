Rails.application.routes.draw do
  root "fronts#top"
  resources :karaoke_shops
end
