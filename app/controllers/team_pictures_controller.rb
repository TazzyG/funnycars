class TeamPicturesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_team_picture, only: [:show, :destroy]
  before_action :set_team, only: [:show, :destroy]
  
  def create
    @team_picture = @team.team_pictures.create(team_picture_params)
    @team_picture.user_id = current_user.id
    
    respond_to do |format|
      if @team_picture.save
        # Tell the UserMailer to send a team_picture email after save
        format.html { redirect_to team_path(@team), notice: 'Team_picture was successfully created.' }
        format.json { render :show, status: :created, location: team_team(@team) }
      else
        format.html { redirect_to team_path(@team), notice: 'Oops, team_picture did not save.' }
        format.json { render json: @team_picture.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def edit
  end
  
  def update
    if @team_picture.update(team_picture_params)
      redirect_to @team_picture, notice: 'Team_picture was updated'
    else
      render action: 'edit'
    end
  end
  
  def destroy
    
    @team_picture.destroy
    redirect_to @team
  end
  
  
  private
  def set_team_picture
   @team_picture = TeamPicture.find(params[:id])
  end
  
  def set_team
    @team = Team.find(params[:team_id])
  end
  
  def team_picture_params
    params.require(:team_picture).permit(:title, :picture, :picture_cache, :event_id, :team_id)
  end
end

