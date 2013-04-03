class CreateCategorizations < ActiveRecord::Migration
  def change
    create_table :categorizations do |t|
      t.integer :actor_id
      t.integer :movie_id

      t.timestamps
    end
  end
end
