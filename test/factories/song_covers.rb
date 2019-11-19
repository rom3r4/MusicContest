# == Schema Information
#
# Table name: song_cover
#
#  id        :integer          not null, primary key
#  file_path :string
#  file_type :string
#  file_url  :string
#

FactoryBot.define do
  factory :song_cover do
    file_path { "MyString" }
    file_type { "MyString" }
    file_url { "MyString" }
  end
end
