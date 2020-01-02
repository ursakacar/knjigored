class MakeGenreOptional < ActiveRecord::Migration[6.0]
  def change
    change_column_null :books, :genre_id, true 
  end
end
