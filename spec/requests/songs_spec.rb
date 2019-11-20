# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Songs", type: :request do
  describe "GET /songs" do
    it "get /songs endpoint exists and is correct" do
      get songs_path
      expect(response).to have_http_status(200)
    end
  end
  describe "GET /current_contest_songs/:contest_id" do
    it "get /current_contest_songs endpoint exists and is correct" do
      get "/current_contest_songs/1"
      expect(response).to have_http_status(200)
    end
  end
  describe "POST /delete_song" do
    it "post /delete_song endpoint exists and is correct" do
      post "/delete_song"
      expect(response).to have_http_status(200)
    end
  end
  describe "POST /submit_song" do
    it "post /submit_song endpoint exists and is correct" do
      post "/submit_song"
      expect(response).to have_http_status(200)
    end
  end
end
