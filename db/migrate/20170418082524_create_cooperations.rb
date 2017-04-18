class CreateCooperations < ActiveRecord::Migration[5.0]
  def change
    create_table :cooperations do |t|
      t.string :name

      t.timestamps
    end
  end
end
