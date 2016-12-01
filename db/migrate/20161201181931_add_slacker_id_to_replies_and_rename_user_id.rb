class AddSlackerIdToRepliesAndRenameUserId < ActiveRecord::Migration[5.0]
  def change
    change_table :replies do |t|
      t.rename :user_id, :notetaker_id
    end
    add_column :replies, :slacker_id, :integer
  end
end
