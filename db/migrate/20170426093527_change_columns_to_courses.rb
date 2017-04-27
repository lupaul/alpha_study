class ChangeColumnsToCourses < ActiveRecord::Migration[5.0]
  def change
    add_column :courses, :card_image, :string
    add_column :courses, :banner_image, :string
  end
end
