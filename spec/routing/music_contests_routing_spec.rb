require "rails_helper"

RSpec.describe MusicContestsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/music_contests").to route_to("music_contests#index")
    end

    it "routes to #show" do
      expect(:get => "/music_contests/1").to route_to("music_contests#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/music_contests").to route_to("music_contests#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/music_contests/1").to route_to("music_contests#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/music_contests/1").to route_to("music_contests#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/music_contests/1").to route_to("music_contests#destroy", :id => "1")
    end
  end
end
