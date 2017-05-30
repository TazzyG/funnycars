class TeamInfo < ApplicationRecord
  belongs_to :team
  belongs_to :topic
  
  def topic_name
    topic.try(:name)
  end
  
  def topic_name=(name)
    self.topic = Topic.find_or_create_by(name: name) if name.present?
  end
  
  
end
