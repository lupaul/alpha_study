class CreateLicenses < ActiveRecord::Migration[5.0]
  def change
    create_table :licenses do |t|
      t.string :title
      t.text :description
      t.string :category
      t.integer :liked
    end
  end
end
