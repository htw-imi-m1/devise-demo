json.extract! user_story, :id, :number, :title, :description, :points, :created_at, :updated_at
json.url user_story_url(user_story, format: :json)
