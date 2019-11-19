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

  belongs_to :song, class_name: "Song", foreign_key: :id
end
