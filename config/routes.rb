Rails.application.routes.draw do
  root "fronts#top"
  post "/result", to: "fronts#result"
  post "/map_search", to: "fronts#map_search"
  get "/calc_price_form", to: "fronts#calc_price_form"
  get "/karaoke_map", to: "fronts#karaoke_map"
  resources :karaoke_shops do
  end
end
