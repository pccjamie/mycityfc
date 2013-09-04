class TeamsController < ApplicationController
  
skip_before_filter :authenticate_user!

  def index
  	@teams = Team.all
  end

  def show
  	@team = Team.find(teams_params)
	end

  def new
  	@team = Team.new
  end

  def edit
  end

  def create
  	@team = Team.create(teams_params)
		if @team.save
		redirect_to teams_path
		else
		redirect_to new_team_path
		end

  end

  def update
  end

  private
  def teams_params
    params.require(:team).permit!
  end

  def users_params
    params.require(:user).permit!(:latitude, :longitude)
  end

end
