class AddColumnsToSchool < ActiveRecord::Migration[5.0]
  def change
    add_column :schools, :location, :string
    add_column :schools, :address, :string
    add_column :schools, :email, :string
    add_column :schools, :liked, :integer
    add_column :schools, :followed, :integer
  end
end
