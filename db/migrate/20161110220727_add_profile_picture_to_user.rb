class AddProfilePictureToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :profile_picture, :string, null: false, default: ""
  end
end
