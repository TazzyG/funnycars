class SponsorsController < ApplicationController
  before_action :authenticate_user!, except: [:index ]
  before_action :set_sponsor, only: [:show, :edit, :update, :destroy]

  def index
    @sponsors = Sponsor.all
    
  end
  
  def show
  end

  def new
    @sponsor = current_user.sponsors.build
  end
  
  def create
    @sponsor = Sponsor.new(sponsor_params)
    @sponsor.user_id = current_user.id
    if @sponsor.save
      redirect_to @sponsor, notice: 'Sponsor was successfully created'
    else
      render action: 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @sponsor.update(sponsor_params)
      redirect_to @sponsor, notice: 'Sponsor was updated'
    else
      render action: 'edit'
    end
  end
  
  def destroy
    @sponsor.destroy
    redirect_to Sponsors_url
  end
  
  private
  
  def set_sponsor
   @sponsor = Sponsor.find(params[:id])   
  end
  def sponsor_params
    params.require(:sponsor).permit(:user_id, :company_name, :picture, :web_site,  :picture_cache, :first_name, :last_name, :email, :phone, :sponsored_with, :amount)
  end
end
