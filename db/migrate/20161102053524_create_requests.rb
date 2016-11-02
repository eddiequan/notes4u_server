class CreateRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :requests do |t|
      t.integer :req_id
      t.string :slacker
      t.integer :course_id
      t.timestamp :when
      t.string :notetaker
    end
  end
end
