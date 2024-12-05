json.array! @courses do |course|
  json.extract! course, :id, :title, :description, :end_date
  json.videos course.videos, :id, :title, :url
end