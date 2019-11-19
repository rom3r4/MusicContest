# == Schema Information
#
# Table name: participant
#
#  id      :integer          not null, primary key
#  name    :string(100)
#  surname :string(100)
#

FactoryBot.define do
  factory :participant do
    name { "MyString" }
    surname { "MyString" }
  end
end
