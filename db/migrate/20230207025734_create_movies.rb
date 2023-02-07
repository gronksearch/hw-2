class CreateMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :movies do |t|
      t.string "title"
      t.string "rated"
      t.integer "year_released"
      t.integer "studio_id"


      t.timestamps
    end
  end
end