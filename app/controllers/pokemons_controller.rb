class PokemonsController < ApplicationController
  def index
    pokemon_ids = [1, 4, 7, 152, 155, 158, 252, 255, 258, 387, 390, 393, 495, 498, 501, 650, 653, 656, 722, 725, 728, 810, 813, 816, 906, 909, 912]
    @pokemon_data = []

    pokemon_ids.each do |id|
      response = Faraday.get "https://pokeapi.co/api/v2/pokemon/#{id}"
      pokemon = JSON.parse(response.body)

      # 種類のURLから追加のデータを取得
      species_response = Faraday.get pokemon["species"]["url"]
      species_data = JSON.parse(species_response.body)

      # 日本語の名前を探す
      ja_name = species_data["names"].find { |v| v["language"]["name"] == "ja" }["name"]

      # 日本語の名前を含むポケモンのデータを@pokemon_dataに追加
      @pokemon_data << {
        "name" => ja_name, # 日本語の名前
        "sprites" => pokemon["sprites"] # 画像のURLなど
      }
    end
  end
end
