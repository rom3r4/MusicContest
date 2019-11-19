class SongCover < ApplicationRecord
  self.table_name = 'song_cover'

  belongs_to :song, class_name: 'Song', foreign_key: :id
end
