Rails.application.routes.draw do
  root "fronts#top"
  post "/result", to: "fronts#result"
  resources :karaoke_shops do
  end


end
