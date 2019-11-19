# frozen_string_literal: true

# == Schema Information
#
# Table name: participant
#
#  id      :integer          not null, primary key
#  name    :string(100)
#  surname :string(100)
#

class Participant < ApplicationRecord
  self.table_name = "participant"

  has_many :music_contests, class_name: "MusicContest"
  has_many :songs, class_name: "Song"
  has_many :contest_song_participant_votes, class_name: "ContestSongParticipantVote"
end
