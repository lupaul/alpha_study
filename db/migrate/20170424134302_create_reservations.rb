class CreateReservations < ActiveRecord::Migration[5.0]
  def change
    create_table :reservations do |t|
      t.string :subject
      t.datetime :datetime
      t.string :status
      t.integer :user_id
      t.timestamps
    end
  end
end
