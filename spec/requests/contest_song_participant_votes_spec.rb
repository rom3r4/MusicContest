require 'rails_helper'

RSpec.describe "ContestSongParticipantVotes", type: :request do
  describe "GET /contest_song_participant_votes" do
    it "works! (now write some real specs)" do
      get contest_song_participant_votes_path
      expect(response).to have_http_status(200)
    end
  end
end
