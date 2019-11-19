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

require 'rails_helper'

RSpec.describe MusicContest, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
