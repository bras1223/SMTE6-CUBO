Rails.application.routes.draw do
  apipie
  namespace 'api' do
    namespace 'v1' do
      resources :games
    end
  end

  mount Apidoco::Engine, at: "/docs"
end