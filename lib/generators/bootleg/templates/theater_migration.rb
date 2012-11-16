class CreateBootlegTheaters < ActiveRecord::Migration
  def change
    create_table :bootleg_theaters do |t|
      t.string :name
      t.string :href

      t.timestamps
    end
  end
end
