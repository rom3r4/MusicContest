require 'rails_helper'

RSpec.describe "Participants", type: :request do
  describe "GET /participants" do
    it "works! (now write some real specs)" do
      get participants_path
      expect(response).to have_http_status(200)
    end
  end
end
