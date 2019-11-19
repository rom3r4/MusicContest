# frozen_string_literal: true

class CurrentContest
  prepend SimpleCommand

  def initialize(song_id)
    @song_id = song_id
  end

  def call
    current_contest
  end

  private

  def current_contest
    false
  end
end
