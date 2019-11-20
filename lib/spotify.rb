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

    #
    # The methods do not keep any state in the server (Representational state transfer)
    #

    def authenticate(client_id, client_secret)
      @client_id = client_id
      @client_secret = client_secret
      request_body = {grant_type: "client_credentials"}
      response = RestClient.post(TOKEN_URI, request_body, auth_header)
      @client_token = JSON.parse(response)["access_token"]
      @client_token
    end

    def id_from_url(_spotify_url)
      "__test_spotify_id__"
    end

    def title(_spotify_id)
      "__test_spotify_title__"
    end

    def cover(_spotify_id)
      "__test_spotify_cover_url__"
    end

    def artist(_spotify_id)
      "__test_spotify_artist__"
    end

    def length(_spotify_id)
      # value in seconds
      120
    end

    def album(_spotify_id)
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
