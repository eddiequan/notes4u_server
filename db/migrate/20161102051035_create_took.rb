class CreateTook < ActiveRecord::Migration[5.0]
  def change
    create_table :tooks do |t|
      t.integer :course_id
      t.string :username
      t.decimal :grade
    end
  end
end
