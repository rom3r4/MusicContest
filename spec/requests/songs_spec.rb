# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Songs", type: :request do
  let(:incorrect_trackid) {
    {song: {participant_id: 1, spotify_url: "spotify.com/__id__"}}
  }
  let(:correct_trackid1) {
    {song: {participant_id: 1, spotify_url: "https://play.spotify.com/user/spotifydiscover/playlist/0vL3R9wDeAwmXTTuRATa14"}}
  }
  let(:correct_trackid2) {
    {song: {participant_id: 1, spotify_url: "https://open.spotify.com/track/1hKdDCpiI9mqz1jVHRKG0E"}}
  }
  let(:correct_trackid3) {
    {song: {participant_id: 1, spotify_url: "spotify:track:1TZ3z6TBztuY0TLUlJZ8R7"}}
  }

  describe "GET /songs" do
    it "get /songs endpoint exists and is correct" do
      get songs_path
      expect(response).to have_http_status(200)
    end
  end
  describe "GET /current_contest_songs" do
    it "get /current_contest_songs endpoint exists and is correct" do
      get "/current_contest_songs"
      expect(response).to have_http_status(200)
    end
  end
  describe "GET /current_contest_ranking" do
    it "get /current_contest_ranking endpoint exists and is correct" do
      get "/current_contest_ranking"
      expect(response).to have_http_status(200)
    end
  end
  describe "POST /submit_song (wrong spotify TrackId)" do
    it "post /submit_song endpoint exists and is correct" do
      post "/submit_song", params: incorrect_trackid
      expect(response).to have_http_status(455)
    end
  end
  describe "POST /delete_song (wrong spotify TrackId)" do
    it "post /delete_song endpoint exists and is correct" do
      post "/delete_song", params: incorrect_trackid
      expect(response).to have_http_status(455)
    end
  end
  describe "POST /submit_song (correct spotify TrackId - 1)" do
    it "post /submit_song endpoint exists and is correct" do
      post "/submit_song", params: correct_trackid1
      expect(response).to have_http_status(201)
    end
  end
  describe "POST /delete_song (correct spotify TrackId - 1)" do
    it "post /delete_song endpoint exists and is correct" do
      post "/delete_song", params: correct_trackid1
      expect(response).to have_http_status(450)
    end
  end
  describe "POST /submit_song (correct spotify TrackId - 2)" do
    it "post /submit_song endpoint exists and is correct" do
      post "/submit_song", params: correct_trackid2
      expect(response).to have_http_status(201)
    end
  end
  describe "POST /delete_song (correct spotify TrackId - 2)" do
    it "post /delete_song endpoint exists and is correct" do
      post "/delete_song", params: correct_trackid2
      expect(response).to have_http_status(450)
    end
  end
  describe "POST /submit_song (correct spotify TrackId - 3)" do
    it "post /submit_song endpoint exists and is correct" do
      post "/submit_song", params: correct_trackid3
      expect(response).to have_http_status(201)
    end
  end
  describe "POST /delete_song (correct spotify TrackId - 3)" do
    it "post /delete_song endpoint exists and is correct" do
      post "/delete_song", params: correct_trackid3
      puts response.parsed_body
      expect(response).to have_http_status(450)
    end
  end
end
