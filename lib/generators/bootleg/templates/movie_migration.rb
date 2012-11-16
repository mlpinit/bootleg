class CreateBootlegMovies < ActiveRecord::Migration
  def change
    create_table :bootleg_movies do |t|
      t.string :name
      t.string :href
      t.string :showtimes

      t.timestamps
    end
  end
end