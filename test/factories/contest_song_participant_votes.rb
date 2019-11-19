# == Schema Information
#
# Table name: contest_song_participant_vote
#
#  id             :integer          not null, primary key
#  participant_id :integer
#  song_id        :integer
#

FactoryBot.define do
  factory :contest_song_participant_vote do
    participant { nil }
    song { nil }
  end
end
