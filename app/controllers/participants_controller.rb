# frozen_string_literal: true

class ParticipantsController < ApplicationController
  before_action :set_participant, only: %i[show update destroy]

  respond_to :json

  def index
    @participants = Participant.all
    respond_with(@participants)
  end

  def show
    respond_with(@participant)
  end

  def create
    @participant = Participant.new(participant_params)
    @participant.save
    respond_with(@participant)
  end

  def update
    @participant.update(participant_params)
    respond_with(@participant)
  end

  def destroy
    @participant.destroy
    respond_with(@participant)
  end

  private

  def set_participant
    @participant = Participant.find(params[:id])
  end

  def participant_params
    params.require(:participant).permit(:name, :surname)
  end
end
