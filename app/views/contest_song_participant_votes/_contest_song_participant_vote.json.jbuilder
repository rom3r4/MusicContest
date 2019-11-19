# frozen_string_literal: true

json.extract! contest_song_participant_vote, :id, :participant_id, :song_id
json.url contest_song_participant_vote_url(contest_song_participant_vote, format: :json)
