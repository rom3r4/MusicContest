# frozen_string_literal: true

class SongsController < ApplicationController
  before_action :set_song, only: %i[show update destroy]
  before_action :current_participant, only: %i[submit_song delete_submitted_song]
  before_action :submitted_spotify_song, only: %i[submit_song]

  include Spotify

  respond_to :json

  def current_contest_songs
    # TODO: mocked-up
    render json: {}, status: 200
  end

  def submit_song
    raise ExceptionHandler::UserNotFound, "Participant Not Found" unless @submitting_user.presence

    unless submit_allowed
      raise ExceptionHandler::MaximumSongsSubmitted,
            "You have already submitted your maximum allowed songs"
    end

    if song_has_already_been_submitted
      raise ExceptionHandler::SongWasAlreadySubmitted,
            "This song has already been submitted to a different contest"
    end

    @song = Song.new(new_song)
    @song.save
    respond_with(@song)
  end

  def delete_submitted_song
    # TODO: mocked-up
    render json: {}, status: 200
  end

  def index
    @songs = Song.all
    respond_with(@songs)
  end

  def show
    respond_with(@song)
  end

  def create
    @song = Song.new(song_params)
    @song.save
    respond_with(@song)
  end

  def update
    @song.update(song_params)
    respond_with(@song)
  end

  def destroy
    @song.destroy
    respond_with(@song)
  end

  private

  def set_song
    @song = Song.find(params[:id])
  end

  def current_participant
    @submitting_user = Participant.find(params[:song][:participant_id])
  end

  def submitted_spotify_song
    @spotify_url = params[:song][:spotify_url]
    @spotify_id = Spotify.id_from_url(@spotify_url)
    @submitted_song = Song.where(spotify_id: @spotify_id).first
  end

  def song_params
    params.require(:song).permit(:spotify_id, :spotify_url, :spotify_title,
                                 :spotify_artist, :spotify_length, :spotify_album,
                                 :spotify_cover_id, :contest_id, :submitby_user_id,
                                 :participant_id)
  end

  def submit_allowed
    SongSubmitAllowed.call(@submitting_user).result
  end

  def song_has_already_been_submitted
    !@submitted_song.nil?
  end

  def current_contest
    CurrentContest.call.result
  end

  def new_song
    # TODO: Call SongCover.new(Spotify::cover(@spotify_id))
    {
      spotify_id:       @spotify_id,
      spotify_url:      @spotify_url,
      spotify_title:    Spotify.title(@spotify_id),
      spotify_artist:   Spotify.artist(@spotify_id),
      spotify_length:   Spotify.length(@spotify_id),
      spotify_album:    Spotify.album(@spotify_id),
      contest_id:       current_contest.id,
      submitby_user_id: @submitting_user.id
    }
  end
end
