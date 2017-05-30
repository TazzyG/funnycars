json.array! team_info do |team_info|
  team_info.id
  team_info.body
  team_info.topic_id
  team_info. created_at
  team_info.updated_at 
  link_to [team_info.team, team_info], method: :delete, data: { confirm: 'Are you sure?' }
end