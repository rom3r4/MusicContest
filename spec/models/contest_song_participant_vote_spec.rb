# == Schema Information
#
# Table name: contest_song_participant_vote
#
#  id             :integer          not null, primary key
#  participant_id :integer
#  song_id        :integer
#

require 'rails_helper'

RSpec.describe ContestSongParticipantVote, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
