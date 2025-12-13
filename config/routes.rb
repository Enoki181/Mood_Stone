Rails.application.routes.draw do
  root "stone_converter#index"
  get "stone_converter/convert", to: "stone_converter#convert"
end
