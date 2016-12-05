json.array!(@lectures) do |lecture|
  json.extract! lecture, :id, :title, :content, :attached_file, :course_id
  json.url lecture_url(lecture, format: :json)
end
