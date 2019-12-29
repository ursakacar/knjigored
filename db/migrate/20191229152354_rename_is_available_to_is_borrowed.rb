class RenameIsAvailableToIsBorrowed < ActiveRecord::Migration[6.0]
  def change
    rename_column :books, :is_available, :is_borrowed
  end
end
