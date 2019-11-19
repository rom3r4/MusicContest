# frozen_string_literal: true

json.array! @contest_song_participant_votes, partial: "contest_song_participant_votes/contest_song_participant_vote", as: :contest_song_participant_vote
