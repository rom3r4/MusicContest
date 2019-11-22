# frozen_string_literal: true

# Assuming these valid Spotify-track URI formats:
#
# https://play.spotify.com/user/spotifydiscover/playlist/0vL3R9wDeAwmXTTuRATa14
# https://open.spotify.com/track/1hKdDCpiI9mqz1jVHRKG0E
# spotify:track:1TZ3z6TBztuY0TLUlJZ8R7

require "addressable"
require "base64"
require "json"
require "restclient"

class SpotifyService
  API_URI       = "https://api.spotify.com/v1/"
  TOKEN_URI     = "https://accounts.spotify.com/api/token"

  attr_reader :valid, :url, :track_id, :title, :cover, :artist, :length, :album

  def initialize(track_url)
    @url = track_url
    # regexp; no remote access
    @valid, @track_id = parse_spotify_uri(@url)
    raise ExceptionHandler::SpotifyURIParsingError, "Spotify's TrackId parsing error" unless @valid
  end

  def fetch
    if @valid
      @access_token = access_token
    else
      puts "kk"
      false
    end
    puts @access_token.to_json
  end

  def valid?
    @valid
  end

  private

  def access_token
    @client_id = ENV.fetch("SPOTIFY_CLIENT_ID") { "" }
    @client_secret = ENV.fetch("SPOTIFY_CLIENT_SECRET") { "" }
    request_body = {grant_type: "client_credentials"}
    response = RestClient.post(TOKEN_URI, request_body, auth_header)
    JSON.parse(response)["access_token"]
  rescue RestClient::Unauthorized 
    raise ExceptionHandler::SpotifyAPIError, "Error Accessing Spotify's API. Unauthorized"
  end

  def parse_spotify_uri(uri)
    regx = %r{^(spotify:track:|
            https://play\.spotify\.com/user/spotifydiscover/playlist/|
            https:\/\/open\.spotify\.com\/track\/)([\w]+)$
            }x
    valid = regx.match(uri) ? true : false
    track_id = nil
    if valid
      track_id = uri.gsub(regx, '\2')
      track_id.blank? ? nil : track_id
    end
    [valid, track_id]
  end

  def auth_header
    authorization = Base64.strict_encode64("#{@client_id}:#{@client_secret}")
    {"Authorization" => "Basic #{authorization}"}
  end

  def get_headers(params)
    params.find {|param| param.is_a?(Hash) && param["Authorization"] }
  end
end
