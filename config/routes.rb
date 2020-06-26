Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  scope '/api' do
    scope '/word' do 
        post '/' => 'dictionary#search'
    end
  end
end
