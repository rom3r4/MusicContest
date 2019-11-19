# frozen_string_literal: true

# == Route Map
#
#                         Prefix Verb   URI Pattern                                                                              Controller#Action
#                    song_covers GET    /song_covers(.:format)                                                                   song_covers#index {:format=>:json}
#                                POST   /song_covers(.:format)                                                                   song_covers#create {:format=>:json}
#                     song_cover GET    /song_covers/:id(.:format)                                                               song_covers#show {:format=>:json}
#                                PATCH  /song_covers/:id(.:format)                                                               song_covers#update {:format=>:json}
#                                PUT    /song_covers/:id(.:format)                                                               song_covers#update {:format=>:json}
#                                DELETE /song_covers/:id(.:format)                                                               song_covers#destroy {:format=>:json}
#                          songs GET    /songs(.:format)                                                                         songs#index {:format=>:json}
#                                POST   /songs(.:format)                                                                         songs#create {:format=>:json}
#                           song GET    /songs/:id(.:format)                                                                     songs#show {:format=>:json}
#                                PATCH  /songs/:id(.:format)                                                                     songs#update {:format=>:json}
#                                PUT    /songs/:id(.:format)                                                                     songs#update {:format=>:json}
#                                DELETE /songs/:id(.:format)                                                                     songs#destroy {:format=>:json}
#                   participants GET    /participants(.:format)                                                                  participants#index {:format=>:json}
#                                POST   /participants(.:format)                                                                  participants#create {:format=>:json}
#                    participant GET    /participants/:id(.:format)                                                              participants#show {:format=>:json}
#                                PATCH  /participants/:id(.:format)                                                              participants#update {:format=>:json}
#                                PUT    /participants/:id(.:format)                                                              participants#update {:format=>:json}
#                                DELETE /participants/:id(.:format)                                                              participants#destroy {:format=>:json}
#                 music_contests GET    /music_contests(.:format)                                                                music_contests#index {:format=>:json}
#                                POST   /music_contests(.:format)                                                                music_contests#create {:format=>:json}
#                  music_contest GET    /music_contests/:id(.:format)                                                            music_contests#show {:format=>:json}
#                                PATCH  /music_contests/:id(.:format)                                                            music_contests#update {:format=>:json}
#                                PUT    /music_contests/:id(.:format)                                                            music_contests#update {:format=>:json}
#                                DELETE /music_contests/:id(.:format)                                                            music_contests#destroy {:format=>:json}
# contest_song_participant_votes GET    /contest_song_participant_votes(.:format)                                                contest_song_participant_votes#index {:format=>:json}
#                                POST   /contest_song_participant_votes(.:format)                                                contest_song_participant_votes#create {:format=>:json}
#  contest_song_participant_vote GET    /contest_song_participant_votes/:id(.:format)                                            contest_song_participant_votes#show {:format=>:json}
#                                PATCH  /contest_song_participant_votes/:id(.:format)                                            contest_song_participant_votes#update {:format=>:json}
#                                PUT    /contest_song_participant_votes/:id(.:format)                                            contest_song_participant_votes#update {:format=>:json}
#                                DELETE /contest_song_participant_votes/:id(.:format)                                            contest_song_participant_votes#destroy {:format=>:json}
#             rails_service_blob GET    /rails/active_storage/blobs/:signed_id/*filename(.:format)                               active_storage/blobs#show
#      rails_blob_representation GET    /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format) active_storage/representations#show
#             rails_disk_service GET    /rails/active_storage/disk/:encoded_key/*filename(.:format)                              active_storage/disk#show
#      update_rails_disk_service PUT    /rails/active_storage/disk/:encoded_token(.:format)                                      active_storage/disk#update
#           rails_direct_uploads POST   /rails/active_storage/direct_uploads(.:format)                                           active_storage/direct_uploads#create

Rails.application.routes.draw do
  defaults format: :json do
    resources :song_covers
    resources :songs
    resources :participants
    resources :music_contests
    resources :contest_song_participant_votes
    get "/current_contest", to: "music_contests#current_contest"
    get "/current_contest_songs", to: "songs#current_contest_songs"
    post "/delete_song", to: "songs#delete_submitted_song"
    post "/submit_song", to: "songs#submit_song"
    get "/current_contest_ranking",
        to: "contest_song_participant_votes#current_contest_ranking"
    post "/vote_song",
        to: "contest_song_participant_votes#vote_song"
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
