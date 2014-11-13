class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :book_cover
      t.integer :isbn, :limit => 8

      t.timestamps
    end
  end
end
