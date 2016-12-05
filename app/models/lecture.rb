class Lecture < ActiveRecord::Base
	acts_as_votable
  belongs_to :course
  has_many :comments
  validates :title, :presence => true, :uniqueness => true
  mount_uploader :attached_file, AttachedUploader
end
