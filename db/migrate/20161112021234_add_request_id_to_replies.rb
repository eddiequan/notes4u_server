class AddRequestIdToReplies < ActiveRecord::Migration[5.0]
  def change
    add_column :replies, :request_id, :int
    remove_column :replies, :req_id
  end
end
