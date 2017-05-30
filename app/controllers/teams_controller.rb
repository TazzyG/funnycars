class TeamsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_team, only: [:show, :edit, :update, :destroy]

  def index
    @teams = Team.all
    @articles = Article.all
  end
  
  def show
  end

  def new
    @team = current_user.teams.build
  end
  
  def create
    @team = Team.new(team_params)
    @team.user_id = current_user.id
    if @team.save
      redirect_to @team, notice: 'Team was successfully created'
    else
      render action: 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @team.update(team_params)
      redirect_to @team, notice: 'Team was updated'
    else
      render action: 'edit'
    end
  end
  
  def destroy
    @team.destroy
    redirect_to teams_url
  end
  
  private
  
  def set_team
   @team = Team.find(params[:id])   
  end
  def team_params
    params.require(:team).permit(:team_name, :driver, :home_town, :crew_chief, :crew, :car, :car_name, :engine, :chassis, :picture, :facebook, :youtube, :instagram, :user_id)
  end
end
