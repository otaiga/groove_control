GrooveRails::Application.routes.draw do
  root :to => 'grooves#index'
  resources :grooves
  get "play_control" => "grooves#play_control"
end
