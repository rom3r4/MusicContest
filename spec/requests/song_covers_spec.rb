require 'rails_helper'

RSpec.describe "SongCovers", type: :request do
  describe "GET /song_covers" do
    it "works! (now write some real specs)" do
      get song_covers_path
      expect(response).to have_http_status(200)
    end
  end
end
