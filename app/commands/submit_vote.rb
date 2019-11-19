# frozen_string_literal: true

class SubmitVote
  prepend SimpleCommand

  def initialize(voter_id, song_id)
    @voter_id = voter_id
    @song_id = song_id
  end

  def call
    submit_vote
  end

  private

  def submit_vote
    false
  end
end
