json.extract! @course, :id, :name, :description
  json.comments @course.videos do |video|
    json.extract! video, :id, :title, :url
  end