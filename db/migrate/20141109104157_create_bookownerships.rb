class CreateBookownerships < ActiveRecord::Migration
  def change
    create_table :bookownerships do |t|
      t.belongs_to :user
      t.belongs_to :book
      t.string :book_review
      t.integer :current_page
      t.boolean :completed, default: false

      t.timestamps
    end
  end
end
