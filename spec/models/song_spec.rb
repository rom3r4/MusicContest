# frozen_string_literal: true

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

require "rails_helper"

RSpec.describe Song, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
