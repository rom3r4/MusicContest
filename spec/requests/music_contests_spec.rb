require 'rails_helper'

RSpec.describe "MusicContests", type: :request do
  describe "GET /music_contests" do
    it "works! (now write some real specs)" do
      get music_contests_path
      expect(response).to have_http_status(200)
    end
  end
end
