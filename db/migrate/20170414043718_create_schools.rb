class CreateSchools < ActiveRecord::Migration[5.0]
  def change
    create_table :schools do |t|
      t.string :name
      t.string :description
      t.integer :user_id, index: true

      t.timestamps
    end
  end
end
