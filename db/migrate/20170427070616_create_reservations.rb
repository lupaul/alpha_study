class CreateReservations < ActiveRecord::Migration[5.0]
  def change
    create_table :reservations do |t|
      t.string :subject
      t.string :location
      t.boolean :is_online
      t.datetime :datetime
      t.string :status
      t.integer :min_participants, default: 3
      t.integer :liked, default: 0
      t.string :card_image
      t.references :user, index: true
      t.timestamps
    end
  end
end
