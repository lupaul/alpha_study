class CreateLikes < ActiveRecord::Migration[5.0]
  def change
    create_table :likes do |t|
      t.integer :user_id
      t.belongs_to :likeable, polymorphic: true

      t.timestamps
    end
  end
end
