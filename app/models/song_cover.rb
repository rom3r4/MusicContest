# frozen_string_literal: true

# == Schema Information
#
# Table name: song_cover
#
#  id        :integer          not null, primary key
#  file_path :string
#  file_type :string
#  file_url  :string
#

class SongCover < ApplicationRecord
  self.table_name = "song_cover"

  has_many :songs, class_name: "Song"
end
