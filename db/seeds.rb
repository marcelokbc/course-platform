# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# Seed file to create courses and associate one video with each course

# Adding courses
courses = Course.create([
  { title: "Ruby on Rails", description: "Learn how to build web applications using Ruby on Rails.", end_date: "2022-12-31" },
  { title: "React", description: "Learn how to build interactive user interfaces using React.", end_date: "2022-12-31" },
  { title: "Vue.js", description: "Learn how to build interactive user interfaces using Vue.js.", end_date: "2022-12-31" }
])

# Adding a single video for each course
courses.each do |course|
  case course.title
  when "Ruby on Rails"
    course.videos.create(title: "Introduction to #{course.title}", url: "https://www.youtube.com/watch?v=fmyvWz5TUWg", size: rand(500..2000))
  when "React"
    course.videos.create(title: "Introduction to #{course.title}", url: "https://www.youtube.com/watch?v=Ke90Tje7VS0", size: rand(500..2000))
  when "Vue.js"
    course.videos.create(title: "Introduction to #{course.title}", url: "https://www.youtube.com/watch?v=4deVCNJq3qc", size: rand(500..2000))
  end
end