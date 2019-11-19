FactoryBot.define do
  factory :song do
    spotify { nil }
    spotify_url { "MyString" }
    spotify_title { "MyString" }
    spotify_artist { "MyString" }
    spotify_length { 1 }
    spotify_album { "MyString" }
    spotify_cover { nil }
    contest { nil }
    submitby_user { nil }
  end
end
