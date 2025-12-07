Rails.application.routes.draw do
  root "stone_converter#index"
  get "convert", to: "stone_converter#convert"
end
