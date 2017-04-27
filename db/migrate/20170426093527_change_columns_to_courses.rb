class ChangeColumnsToCourses < ActiveRecord::Migration[5.0]
  def change
    add_column :courses, :card_img_url, :string
    add_column :courses, :banner_img_url, :string
  end
end
