require "rails_helper"

RSpec.describe ContestSongParticipantVotesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/contest_song_participant_votes").to route_to("contest_song_participant_votes#index")
    end

    it "routes to #show" do
      expect(:get => "/contest_song_participant_votes/1").to route_to("contest_song_participant_votes#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/contest_song_participant_votes").to route_to("contest_song_participant_votes#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/contest_song_participant_votes/1").to route_to("contest_song_participant_votes#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/contest_song_participant_votes/1").to route_to("contest_song_participant_votes#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/contest_song_participant_votes/1").to route_to("contest_song_participant_votes#destroy", :id => "1")
    end
  end
end
