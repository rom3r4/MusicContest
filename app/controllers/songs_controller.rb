# frozen_string_literal: true

class SongsController < ApplicationController
  before_action :set_song, only: %i[show update destroy]
  before_action :current_participant, :check_participant_exists,
                :submitted_spotify_song, only: %i[submit_song delete_submitted_song]

  respond_to :json

  def current_contest_ranking
    # TODO: mocked-up
    render json: {}, status: 200
  end

  def current_contest_songs
    @songs = Song.where(contest_id: current_contest)
    merged_songs = []
    @songs.each_with_index do |song, index|
      votes = {"votes": ContestSongParticipantVote.where(song_id: song.id).count}
      merged_songs << @songs[index].as_json.merge(votes)
    end
    respond_with(merged_songs)
  end

  def submit_song
    unless submit_allowed
      raise ExceptionHandler::MaximumSongsSubmitted,
            "You have already submitted your maximum allowed songs"
    end
    unless submitted_song_does_not_exists
      raise ExceptionHandler::SongWasAlreadySubmitted,
            "This song has already been submitted to a different contest"
    end

    @song = Song.new(new_song)
    @song.save
    respond_with(@song)
  end

  def delete_submitted_song
    raise ExceptionHandler::SongNotFound, "The song must exist" if submitted_song_does_not_exists
    raise ExceptionHandler::ParticipantCannotDelete, "Participant can not delete this song" unless delete_allowed

    @submitted_song.destroy
    respond_with(@submitted_song)
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
    spotify_url = params[:song][:spotify_url]
    @spotify = SpotifyService.new(spotify_url)
    @spo = @spotify.fetch
    @submitted_song = Song.where(spotify_id: @spotify.track_id).first
  end

  def submitted_song_does_not_exists
    @submitted_song.nil?
  end

  def submit_allowed
    SongSubmitAllowed.call(@submitting_user).result
  end

  def delete_allowed
    SongDeleteAllowed.call(@submitting_user.id, @submitted_song.id)
  end

  def current_contest
    CurrentContest.call.result
  end

  def check_participant_exists
    raise ExceptionHandler::UserNotFound, "Participant Not Found" unless @submitting_user.presence
  end

  def new_song
    # TODO: Call SongCover.new(Spotify::cover(@spotify_id))
    {
      spotify_id:       @spotify.track_id,
      spotify_url:      @spotify.url,
      spotify_title:    @spotify.title,
      spotify_artist:   @spotify.artist,
      spotify_length:   @spotify.length,
      spotify_album:    @spotify.album,
      contest_id:       current_contest.id,
      submitby_user_id: @submitting_user.id
    }
  end

  def song_params
    params.require(:song).permit(:spotify_id, :spotify_url, :spotify_title,
                                 :spotify_artist, :spotify_length, :spotify_album,
                                 :spotify_cover_id, :contest_id, :submitby_user_id,
                                 :participant_id)
  end
end
