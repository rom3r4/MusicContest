require 'rails_helper'

RSpec.describe "Songs", type: :request do
  describe "GET /songs" do
    it "works! (now write some real specs)" do
      get songs_path
      expect(response).to have_http_status(200)
    end
  end
end
