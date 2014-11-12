class AddColumnCurrentlyReadingFromBookOwnerships < ActiveRecord::Migration
  def change
    add_column :book_ownerships, :currently_reading, :boolean, :default => false
  end
end
