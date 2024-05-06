require 'faraday'
require 'json'

pokemon_ids = [1, 4, 7, 152, 155, 158, 252, 255, 258, 387, 390, 393, 495, 498, 501, 650, 653, 656, 722, 725, 728, 810,
               813, 816, 906, 909, 912]

pokemon_ids.each do |id|
  response = Faraday.get "https://pokeapi.co/api/v2/pokemon/#{id}"
  fetched_pokemon = JSON.parse(response.body)

  species_response = Faraday.get fetched_pokemon['species']['url']
  species_data = JSON.parse(species_response.body)

  ja_name = species_data['names'].find { |v| v['language']['name'] == 'ja' }['name']

  Pokemon.find_or_create_by(name: ja_name) do |pokemon|
    pokemon.sprites = fetched_pokemon['sprites'].to_json
  end
end
