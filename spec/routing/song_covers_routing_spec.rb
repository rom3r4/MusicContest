require "rails_helper"

RSpec.describe SongCoversController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/song_covers").to route_to("song_covers#index")
    end

    it "routes to #show" do
      expect(:get => "/song_covers/1").to route_to("song_covers#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/song_covers").to route_to("song_covers#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/song_covers/1").to route_to("song_covers#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/song_covers/1").to route_to("song_covers#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/song_covers/1").to route_to("song_covers#destroy", :id => "1")
    end
  end
end
