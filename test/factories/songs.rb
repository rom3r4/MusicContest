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
