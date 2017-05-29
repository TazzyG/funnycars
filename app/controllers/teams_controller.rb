class TeamsController < ApplicationController
  
  def index
    # @teams = Team.all
    @articles = Article.all
  end
end
