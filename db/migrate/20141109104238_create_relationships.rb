class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.belongs_to :follower_id
      t.belongs_to :followed_id

      t.timestamps
    end
  end
end
