class ChangeColumnTypeToSchool < ActiveRecord::Migration[5.0]
  def change
    change_column :schools, :description, :text
  end
end
