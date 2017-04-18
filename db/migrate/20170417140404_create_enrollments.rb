class CreateEnrollments < ActiveRecord::Migration[5.0]
  def change
    create_table :enrollments do |t|
      t.string :name
      t.string :email
      t.string :school
      t.string :file_url
      t.text :comment
      t.integer :cooperation_id
      t.timestamps
    end
  end
end
