class AddDefaultToLiked < ActiveRecord::Migration[5.0]
  def change
    change_column :schools, :liked, :integer, default: 0
    change_column :schools, :followed, :integer, default: 0
    change_column :licenses, :liked, :integer, default: 0
    add_column :courses, :liked, :integer, default: 0
    change_column :activities, :liked, :integer, default: 0
  end
end
