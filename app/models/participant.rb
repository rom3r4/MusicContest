class Participant < ApplicationRecord
  self.table_name = 'participant'

  has_many :music_contests, class_name: 'MusicContest'
  has_many :contest_song_participant_votes, class_name: 'ContestSongParticipantVote'
end
