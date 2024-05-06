# frozen_string_literal: true

class PokemonsController < ApplicationController
  def index
    @pokemons = Pokemon.all
    @pokemons_votes = @pokemons.each_with_object({}) do |pokemon, votes_hash|
      votes_hash[pokemon.id] = pokemon.votes.count
    end
  end
end
