class SongCoversController < ApplicationController
  before_action :set_song_cover, only: [:show, :update, :destroy]

  respond_to :json

  def index
    @song_covers = SongCover.all
    respond_with(@song_covers)
  end

  def show
    respond_with(@song_cover)
  end

  def create
    @song_cover = SongCover.new(song_cover_params)
    @song_cover.save
    respond_with(@song_cover)
  end

  def update
    @song_cover.update(song_cover_params)
    respond_with(@song_cover)
  end

  def destroy
    @song_cover.destroy
    respond_with(@song_cover)
  end

  private
  
  def set_song_cover
    @song_cover = SongCover.find(params[:id])
  end

  def song_cover_params
    params.require(:song_cover).permit(:file_path, :file_type, :file_url)
  end
end
