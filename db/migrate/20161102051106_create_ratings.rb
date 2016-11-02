class CreateRatings < ActiveRecord::Migration[5.0]
  def change
    create_table :ratings do |t|
      t.integer :req_id
      t.integer :rating
    end
  end
end
