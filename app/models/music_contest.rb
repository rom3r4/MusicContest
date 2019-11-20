# frozen_string_literal: true

# == Schema Information
#
# Table name: music_contest
#
#  id             :integer          not null, primary key
#  contest_status :string(10)
#  topic          :string(520)
#  winner_user_id :integer
#  start_date     :date
#  end_date       :date
#

class MusicContest < ApplicationRecord
  self.table_name = "music_contest"

  belongs_to :participant, class_name: "Participant", foreign_key: :winner_user_id, optional: true
  has_many :songs, class_name: "Song"
end
