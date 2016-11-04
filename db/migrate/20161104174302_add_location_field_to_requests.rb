class AddLocationFieldToRequests < ActiveRecord::Migration[5.0]
  def change
    change_table :requests do |t|
      t.remove :location, :user_id
      t.string :location
      t.integer :user_id
    end
  end
end
