class ChangeRequestsTable < ActiveRecord::Migration[5.0]

  def change
    change_table :requests do |t|
      t.remove :req_id, :notetaker
      t.rename :slacker, :user_id
    end
  end
end
