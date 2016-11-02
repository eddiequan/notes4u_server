class CreateCourses < ActiveRecord::Migration[5.0]
  self.primary_key = 'course_id'
  def change
    create_table :courses do |t|
      t.integer :course_id
      t.string :course_code
      t.string :semester
      t.string :professor
    end
  end
end
