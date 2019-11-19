Rails.application.routes.draw do
  defaults format: :json do
    resources :song_covers
    resources :songs
    resources :participants
    resources :music_contests
    resources :contest_song_participant_votes
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
