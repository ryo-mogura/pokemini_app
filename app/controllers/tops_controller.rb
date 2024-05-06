# frozen_string_literal: true

class TopsController < ApplicationController
  skip_before_action :require_login, only: [:index]

  MAX_VOTE_COUNT = 3
  def index
    @vote_pokemons = Pokemon.joins(:votes)
                            .group(:id)
                            .order('COUNT(votes.id) DESC')
                            .limit(MAX_VOTE_COUNT)
  end
end
