class RemoveCourseIdFromCourses < ActiveRecord::Migration[5.0]
  def change
    remove_column :courses, :course_id, :int
  end
end
