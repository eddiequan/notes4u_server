class AddDefaultValueToReplies < ActiveRecord::Migration[5.0]
  def change
    change_column :replies, :status, :integer, :default => 1
  end
end
