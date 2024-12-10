json.extract! @course, :id, :title, :description, :end_date
json.videos @course.videos do |video|
  json.extract! video, :id, :title, :url
end
