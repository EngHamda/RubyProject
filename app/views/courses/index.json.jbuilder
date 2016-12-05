json.array!(@courses) do |course|
  json.extract! course, :id, :title, :course_picture
  json.url course_url(course, format: :json)
end
