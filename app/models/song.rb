# frozen_string_literal: true

# == Schema Information
#
# Table name: song
#
#  id               :integer          not null, primary key
#  spotify_id       :string           not null
#  spotify_url      :string
#  spotify_title    :string
#  spotify_artist   :string
#  spotify_length   :integer
#  spotify_album    :string
#  spotify_cover_id :integer
#  contest_id       :integer
#  submitby_user_id :integer
#

class Song < ApplicationRecord
  self.table_name = "song"

  belongs_to :music_contest, class_name: "MusicContest", foreign_key: :contest_id
  belongs_to :participant, class_name: "Participant", foreign_key: :submitby_user_id
  has_many :song_covers, class_name: "SongCover", foreign_key: :spotify_cover_id
  has_many :contest_song_participant_votes, class_name: "ContestSongParticipantVote"
end
