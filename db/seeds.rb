# frozen_string_literal: true

Participant.create!([
                      {name: "name1", surname: "surname1"},
                      {name: "name2", surname: "surname2"}
                    ])
MusicContest.create!([
                       {contest_status: "active", topic: "topic1", winner_user_id: nil, start_date: "2019-01-01", end_date: "2019-12-01"},
                       {contest_status: "active", topic: "topic2", winner_user_id: nil, start_date: "2019-09-01", end_date: "2019-12-01"},
                       {contest_status: "active", topic: "topic3", winner_user_id: nil, start_date: "2019-10-01", end_date: "2019-12-01"},
                       {contest_status: "finished", topic: "topic9", winner_user_id: nil, start_date: "2019-09-01", end_date: "2019-10-01"},
                       {contest_status: "finished", topic: "topic6", winner_user_id: nil, start_date: "2019-08-01", end_date: "2019-09-01"},
                       {contest_status: "active", topic: "topic8", winner_user_id: 1, start_date: "2019-09-01", end_date: "2019-10-02"}
                     ])
SongCover.create!([
                    {file_path: "/files/file1.jpeg", file_type: "jpeg", file_url: "https://s3.amazonws.com/"}
                  ])
Song.create!([
               {spotify_id: "id1", spotify_url: "url1", spotify_title: "title1", spotify_artist: "artist1", spotify_length: 40, spotify_album: "album1", spotify_cover_id: 1, contest_id: 1, submitby_user_id: 1},
               {spotify_id: "id2", spotify_url: "url2", spotify_title: "title2", spotify_artist: "artist2", spotify_length: 40, spotify_album: "album2", spotify_cover_id: 1, contest_id: 1, submitby_user_id: 2}
             ])
ContestSongParticipantVote.create!([
                                     {participant_id: 1, song_id: 1},
                                     {participant_id: 2, song_id: 1},
                                     {participant_id: 2, song_id: 1},
                                     {participant_id: 2, song_id: 2}
                                   ])
