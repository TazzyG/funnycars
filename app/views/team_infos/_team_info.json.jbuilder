json.extract! team_info, :id, :body, :topic_id, :created_at, :updated_at 
json.url team_info_url(team_info, format: :json)