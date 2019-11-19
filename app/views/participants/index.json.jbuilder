# frozen_string_literal: true

json.array! @participants, partial: "participants/participant", as: :participant
