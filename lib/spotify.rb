# frozen_string_literal: true

#
# Authentication method extracted from the RSpotify gem (MIT Licensed)
#

require "addressable"
require "base64"
require "json"
require "restclient"

module Spotify
  API_URI       = "https://api.spotify.com/v1/"
  TOKEN_URI     = "https://accounts.spotify.com/api/token"

  class << self
    attr_accessor :raw_response
    attr_reader :client_token

    def authenticate(client_id, client_secret)
      @client_id = client_id
      @client_secret = client_secret
      request_body = {grant_type: "client_credentials"}
      response = RestClient.post(TOKEN_URI, request_body, auth_header)
      @client_token = JSON.parse(response)["access_token"]
      @client_token
    end

    def spotify_id_from_url(_spotify_url)
      "__test_spotify_id__"
    end

    def spotify_title
      "__test_spotify_title__"
    end

    def spotify_cover_url
      "__test_spotify_cover_url__"
    end

    def spotify_artist
      "__test_spotify_artist__"
    end

    def spotify_track_length
      # value in seconds
      120
    end

    def spotify_album
      "__test_spotify_album__"
    end

    private

    def auth_header
      authorization = Base64.strict_encode64("#{@client_id}:#{@client_secret}")
      {"Authorization" => "Basic #{authorization}"}
    end

    def get_headers(params)
      params.find {|param| param.is_a?(Hash) && param["Authorization"] }
    end
  end
end
