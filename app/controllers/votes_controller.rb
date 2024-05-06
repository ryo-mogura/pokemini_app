class VotesController < ApplicationController
  def new; end
  def create
    @votes = Vote.new(user_id: current_user.id, pokemon_id: params[:pokemon_id])

    if @votes.save
      redirect_to pokemons_path, success: t('votes.create.success')
    else
      redirect_to pokemons_path, danger: t('votes.create.failure')
    end
  end
end
