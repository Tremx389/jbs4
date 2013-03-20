class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.text :about
      t.string :url

      t.timestamps
    end
  end
end
