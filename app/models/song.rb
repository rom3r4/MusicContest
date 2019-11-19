class Song < ApplicationRecord
  self.table_name = 'song'

  has_many :contest_song_participant_votes, class_name: 'ContestSongParticipantVote'
  belongs_to :contest, class_name: 'Contest', foreign_key: :contest_id
end
