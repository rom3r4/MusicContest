FactoryBot.define do
  factory :music_contest do
    contest_status { "MyString" }
    winner_user { nil }
    start_date { "2019-11-19" }
    end_date { "2019-11-19" }
  end
end
