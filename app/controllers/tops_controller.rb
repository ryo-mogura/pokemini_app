class TopsController < ApplicationController
  MAX_VOTE_COUNT = 3
  def index
    @vote_pokemons = Pokemon.joins(:votes)
                            .group(:id)
                            .order('COUNT(votes.id) DESC')
                            .limit(MAX_VOTE_COUNT)
  end
end
