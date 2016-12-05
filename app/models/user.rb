class User < ActiveRecord::Base
  acts_as_voter
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :profile_picture, ProfileUploader

  #belongs_to :course
  has_many :courses
  #has_many :lectures
  has_many :comments

  validates :name, :presence => true #must name has valve
  validates :email, :uniqueness => true #must name has valve & unique
  #validates :password, :presence => true 

end
