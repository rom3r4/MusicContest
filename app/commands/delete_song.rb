# frozen_string_literal: true

class DeleteSong
  prepend SimpleCommand

  def initialize(song_id)
    @song_id = song_id
  end

  def call
    delete_song
  end

  private

  def delete_song
    false
  end
end
