Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'words#index'

  get 'similar', to: 'words#similar'
  get 'rhyme', to: 'words#rhyme'
  get 'scrabble', to: 'words#scrabble'
  get 'dad-joke', to: 'words#dad_joke'

  resource :words
end