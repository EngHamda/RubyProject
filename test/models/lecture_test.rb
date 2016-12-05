require 'test_helper'

class LectureTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "valid lec1 on Ruby Course" do
    assert Lecture.last.title= "Lec2Ruby"
    assert Lecture.last.course_id= 7
  end

end
