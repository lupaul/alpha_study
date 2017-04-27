class CreateConsultations < ActiveRecord::Migration[5.0]
  def change
    create_table :consultations do |t|
      t.string :name
      t.string :email
      t.string :datetime
      t.integer :user_id

      t.timestamps
    end
  end
end
