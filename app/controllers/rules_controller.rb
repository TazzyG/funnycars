class RulesController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_rule, only: [:show, :edit, :update, :destroy]

  def index
    @rules = Rule.all
    
  end
  
  def show
  end

  def new
    @rule = current_user.rules.build
  end
  
  def create
    @rule = Rule.new(rule_params)
    @rule.user_id = current_user.id
    if @rule.save
      redirect_to @rule, notice: 'Rule was successfully created'
    else
      render action: 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @rule.update(rule_params)
      redirect_to @rule, notice: 'Rule was updated'
    else
      render action: 'edit'
    end
  end
  
  def destroy
    @rule.destroy
    redirect_to rules_url
  end
  
  private
  
  def set_rule
   @rule = Rule.find(params[:id])   
  end
  def rule_params
    params.require(:rule).permit(:user_id,:title,  :description, :number, :picture)
  end
end
