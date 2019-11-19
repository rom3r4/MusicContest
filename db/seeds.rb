# frozen_string_literal: true

MusicContest.create!([
                       {contest_status: "active", winner_user_id: nil, start_date: nil, end_date: nil}
                     ])
Participant.create!([
                      {name: "name1", surname: "surname1"}
                    ])
Song.create!([
               {spotify_id: "id1", spotify_url: "url1", spotify_title: "title1", spotify_artist: "artist1", spotify_length: 40, spotify_album: "album1", spotify_cover_id: nil, contest_id: 1, submitby_user_id: 1}
             ])
ContestSongParticipantVote.create!([
                                     {participant_id: 1, song_id: 1}
                                   ])
