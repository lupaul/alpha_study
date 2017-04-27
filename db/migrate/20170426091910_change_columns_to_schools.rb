class ChangeColumnsToSchools < ActiveRecord::Migration[5.0]
  def change
    remove_column :schools, :followed, :integer, default: 0
    remove_column :schools, :liked, :integer, default: 0
    rename_column :schools, :location, :continent
    add_column :schools, :image, :string
  end
end
