class CreatePages < ActiveRecord::Migration[5.0]
  def change
    create_table :pages do |t|
      t.string :slogan
      t.string :main_image
      t.text :first_description
      t.text :second_description
      t.text :third_description
      t.string :first_image
      t.string :second_image
      t.string :third_image
      t.references :user, index: true
      t.timestamps
    end
  end
end
