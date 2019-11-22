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



    def id_from_url(spotify_url)
      # Valid Spotify URI formats:
      # 
      # https://play.spotify.com/user/spotifydiscover/playlist/0vL3R9wDeAwmXTTuRATa14
      # https://open.spotify.com/track/1TZ3z6TBztuY0TLUlJZ8R7
      # spotify:track:1TZ3z6TBztuY0TLUlJZ8R7
      regx = %r(
              ^(spotify:track:|
                https://play\.spotify\.com/user/spotifydiscover/playlist/|
                https:\/\/open\.spotify\.com\/track\/)([\w]+)$
              )
         parsed_id = spotify_url.gsub(regx, '\2')
         parsed_id if parsed_id.blank? else nil
    end

    def title(client_token, spotify_id)
      "__test_spotify_title__"
    end

    def cover(client_token, spotify_id)
      "__test_spotify_cover_url__"
    end

    def artist(client_token, spotify_id)
      "__test_spotify_artist__"
    end

    def length(client_token, spotify_id)
      # value in seconds
      120
    end

    def album(client_token, spotify_id)
      "__test_spotify_album__"
    end

    private

    def correct_uri?(uri)
      reg = %r(
              ^(spotify:track:|
                https://play\.spotify\.com/user/spotifydiscover/playlist/|
                https:\/\/open\.spotify\.com\/track\/)([\w]+)$
              )
      reg.match(uri)? true : false
    end

    def authenticate(client_id, client_secret)
      @client_id = client_id
      @client_secret = client_secret
      request_body = {grant_type: "client_credentials"}
      response = RestClient.post(TOKEN_URI, request_body, auth_header)
      return JSON.parse(response)["access_token"]
    end

    def auth_header
      authorization = Base64.strict_encode64("#{@client_id}:#{@client_secret}")
      {"Authorization" => "Basic #{authorization}"}
    end

    def get_headers(params)
      params.find {|param| param.is_a?(Hash) && param["Authorization"] }
    end
  end
end
