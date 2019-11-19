# == Schema Information
#
# Table name: contest_song_participant_vote
#
#  id             :integer          not null, primary key
#  participant_id :integer
#  song_id        :integer
#

class ContestSongParticipantVote < ApplicationRecord
  self.table_name = 'contest_song_participant_vote'

  belongs_to :song, class_name: 'Song', foreign_key: :song_id
  belongs_to :participant, class_name: 'Participant', foreign_key: :participant_id
end
