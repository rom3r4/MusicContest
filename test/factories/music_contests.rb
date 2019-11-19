# == Schema Information
#
# Table name: music_contest
#
#  id             :integer          not null, primary key
#  contest_status :string(1)
#  winner_user_id :integer
#  start_date     :date
#  end_date       :date
#

FactoryBot.define do
  factory :music_contest do
    contest_status { "MyString" }
    winner_user { nil }
    start_date { "2019-11-19" }
    end_date { "2019-11-19" }
  end
end
