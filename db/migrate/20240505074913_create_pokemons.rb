class CreatePokemons < ActiveRecord::Migration[7.1]
  def change
    create_table :pokemons do |t|
      t.string :name, null: false
      t.text :sprites, null: false

      t.timestamps
    end
  end
end
