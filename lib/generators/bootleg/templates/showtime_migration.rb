class CreateBootlegShowtimes < ActiveRecord::Migration
  def change
    create_table    :bootleg_showtimes do |t|
      t.integer     :bootleg_movie_id
      t.integer     :bootleg_theater_id
      t.string      :showtimes

      t.timestamps
    end
  end
end
