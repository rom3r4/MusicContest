# frozen_string_literal: true

class SubmitSong
  prepend SimpleCommand

  def initialize(participant_id, song_id)
    @participant_id = participant_id
    @song_id = song_id
  end

  def call
    submit_song
  end

  private

  def submit_song
    false
  end
end
