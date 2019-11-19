# frozen_string_literal: true

json.extract! song, :id, :spotify_id, :spotify_url, :spotify_title, :spotify_artist, :spotify_length, :spotify_album, :spotify_cover_id, :contest_id, :submitby_user_id
json.url song_url(song, format: :json)
