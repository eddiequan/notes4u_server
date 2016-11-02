class ChangeRepliesTable < ActiveRecord::Migration[5.0]
  def change
    change_table :replies do |t|
      t.remove :notetaker, :accepted
      t.integer :user_id, :status
    end
  end
end
