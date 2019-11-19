# frozen_string_literal: true

class Ranking
  prepend SimpleCommand

  def initialize; end

  def call
    ranking
  end

  private

  def ranking
    false
  end
end
