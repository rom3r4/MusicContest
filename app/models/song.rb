class Song < ApplicationRecord
  self.table_name = 'song'

  belongs_to :music_contest, class_name: 'MusicContest', foreign_key: :contest_id
  has_many :song_covers, class_name: 'SongCover', foreign_key: :id
  has_many :contest_song_participant_votes, class_name: 'ContestSongParticipantVote'
end
