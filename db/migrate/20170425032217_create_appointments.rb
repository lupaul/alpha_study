class CreateAppointments < ActiveRecord::Migration[5.0]
  def change
    create_table :appointments do |t|
      t.integer :user_id
      t.integer :reservation_id
      t.string :email
      t.timestamps
    end
  end
end
