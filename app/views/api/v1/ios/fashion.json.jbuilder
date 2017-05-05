json.array! @courses do |course|
  json.id course.id
  json.subject course.title
  json.school course.school.name
  json.address course.school.address
  json.course_detail course.description
  json.school_detail course.school.description
  json.image course.card_image_url.to_s
end