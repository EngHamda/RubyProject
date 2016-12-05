class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :title,               null: false
      t.string :course_picture

      t.timestamps null: false
    end
  end
end
