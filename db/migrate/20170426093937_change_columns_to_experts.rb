class ChangeColumnsToExperts < ActiveRecord::Migration[5.0]
  def change
    remove_reference :experts, :user, index: true
    add_reference :experts, :course, index: true
    add_column :experts, :card_img_url, :string
    add_column :experts, :banner_img_url, :string
    add_column :experts, :avatar_img_url, :string
  end
end
