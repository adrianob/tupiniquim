json.extract! feedback, :id, :ambient_grade, :food_grade, :service_grade, :created_at, :updated_at
json.url feedback_url(feedback, format: :json)