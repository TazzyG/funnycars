class TeamInfosController < ApplicationController
before_action :authenticate_user!
before_action :set_team_info, only: [:show, :destroy]
before_action :set_team

# load_and_authorize_resource 
  def index
    @team_infos = Team_info.all.order('created_at DESC').includes(:user)
  end
  
  def new
    
  end
  
   
    
  
  def create
    @team_info = @team.team_infos.create(team_info_params)
    @team_info.user_id = current_user.id
    
    respond_to do |format|
      if @team_info.save
        # Tell the UserMailer to send a team_info email after save
        format.html { redirect_to team_team(@team), notice: 'Team_info was successfully created.' }
        format.json { render :show, status: :created, location: team_team(@team) }
        
        @team.teams.each do |team|
          emails = team.team_memberships.pluck(:email)
          Team_infosMailer.team_info_email(emails, @team, @team_info).deliver
        end
         
      else
        format.html { redirect_to team_team(@team), notice: 'Oops, team_info did not save.' }
        format.json { render json: @team_info.errors, status: :unprocessable_entity }
      end
    end
  end
  def show
  end
  
  def edit
  end
  
   def update
    respond_to do |format|
      if @product.update(team_info_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
   end


  
  def destroy
    @team_info = @team.team_infos.find(params[:id])
    @team_info.destroy
    respond_to do |format|
      format.html { redirect_to team_team(@team), notice: 'Team_info was successfully destroyed.' }
      format.json { head :no_content }
    end
    
  end
  
  private
    def set_team_info
      @team_info = Team_info.find(params[:id])
    end
    
    def set_team
      @team = Team.find(params[:team_id])
    end
  
    # Never trust parameters from the scary internet, only allow the white list through.
    def team_info_params
      params.require(:team_info).permit!
    end

end
