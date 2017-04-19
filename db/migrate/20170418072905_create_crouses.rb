class CreateCrouses < ActiveRecord::Migration[5.0]
  def change
    create_table :crouses do |t|
      t.string :title
      t.text :description
      t.references :school, index: true
      t.references :license, index: true 
    end
  end
end
