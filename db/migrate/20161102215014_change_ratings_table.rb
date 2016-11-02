class ChangeRatingsTable < ActiveRecord::Migration[5.0]
  def change
    change_table :ratings do |t|
      t.rename :req_id, :user_id
    end
  end
end
