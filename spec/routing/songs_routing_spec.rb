# frozen_string_literal: true

require "rails_helper"

RSpec.describe SongsController, type: :routing do
  describe "routing" do
    it "routes to #current_contest_songs" do
      expect(get: "/current_contest_songs").to route_to("songs#current_contest_songs", format: :json)
    end

    it "routes to #delete_submitted_song" do
      expect(post: "/delete_song").to route_to("songs#delete_submitted_song", format: :json)
    end

    it "routes to #submit_song" do
      expect(post: "/submit_song").to route_to("songs#submit_song", format: :json)
    end

    it "routes to #index" do
      expect(get: "/songs").to route_to("songs#index", format: :json)
    end

    it "routes to #show" do
      expect(get: "/songs/1").to route_to("songs#show", id: "1", format: :json)
    end

    it "routes to #create" do
      expect(post: "/songs").to route_to("songs#create", format: :json)
    end

    it "routes to #update via PUT" do
      expect(put: "/songs/1").to route_to("songs#update", id: "1", format: :json)
    end

    it "routes to #update via PATCH" do
      expect(patch: "/songs/1").to route_to("songs#update", id: "1", format: :json)
    end

    it "routes to #destroy" do
      expect(delete: "/songs/1").to route_to("songs#destroy", id: "1", format: :json)
    end
  end
end
