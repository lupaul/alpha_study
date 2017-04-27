class ChangeColumnsToExperts < ActiveRecord::Migration[5.0]
  def change
    remove_reference :experts, :user, index: true
    add_reference :experts, :course, index: true
    add_column :experts, :card_image, :string
    add_column :experts, :banner_image, :string
    add_column :experts, :avatar_image, :string
  end
end
