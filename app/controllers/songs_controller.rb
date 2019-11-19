# frozen_string_literal: true

class SongsController < ApplicationController
  before_action :set_song, only: %i[show update destroy]

  respond_to :json

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

  def song_params
    params.require(:song).permit(:spotify_id, :spotify_url, :spotify_title, :spotify_artist, :spotify_length, :spotify_album, :spotify_cover_id, :contest_id, :submitby_user_id)
  end
end
