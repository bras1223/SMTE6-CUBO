Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :games do
        member do
          get 'start'
          get 'end'
        end
        resources :players
        resources :challenges
      end
    end
  end

  mount Apidoco::Engine, at: "/docs"
end
