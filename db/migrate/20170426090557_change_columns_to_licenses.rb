class ChangeColumnsToLicenses < ActiveRecord::Migration[5.0]
  def change
    remove_column :licenses, :liked, :integer, default: 0
    remove_column :licenses, :category, :string
    add_reference :licenses, :category, index: true
  end
end
