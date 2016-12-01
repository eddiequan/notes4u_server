class AddNotificationsTable < ActiveRecord::Migration[5.0]
  def change
    create_table :notifications do |t|
      t.integer :user_id
      t.string :message
      t.integer :status
    end
  end
end
