class CreateActivities < ActiveRecord::Migration[5.0]
  def change
    create_table :activities do |t|
      t.string :subject
      t.text :description
      t.datetime :datatime
      t.string :location
      t.string :presenter_name
      t.text :presenter_info
      t.string :organizer
      t.integer :liked
      t.references :user, index: true
      t.timestamps
    end
  end
end
