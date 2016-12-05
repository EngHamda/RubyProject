class AddToCourses < ActiveRecord::Migration
  def change
  	#add_column :courses, :part_number, :string
  	add_reference :courses, :user, index: true, foreign_key: true
  end
end
