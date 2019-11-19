class Participant < ApplicationRecord
  self.table_name = 'participant'

  has_many :contests, class_name: 'Contest'
  has_many :contest_song_participant_votes, class_name: 'ContestSongParticipantVote'
end
