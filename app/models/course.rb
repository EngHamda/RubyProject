class Course < ActiveRecord::Base
	mount_uploader :course_picture, CourseUploader
	#has_many :users 
	belongs_to :user
	has_many :lectures

	validates :title, :presence => true, :uniqueness => true
end
