  class FanProfilesController < ApplicationController 

  # def set_access_control_headers
  #   response.headers["Access-Control-Allow-Origin"] = "http://localhost:3000/"
  #   response.headers["Access-Control-Request-Method"] = "*"
  #   response.headers["Access-Control-Allow-Headers"] = "Content-Type"
  #   response.headers["Content-Type"] = "application/json, text/html"
  # end
  
  before_filter :authenticate_user!, :except => [:index]
  
  require 'active_support/all'
  require 'nokogiri'
  require 'open-uri'
  require 'httparty'
  require 'chronic'

  def index
    current_user
    @users = User.all
    @teams = Team.all
    @nearby_teams = Team.near([current_user.latitude,current_user.longitude], 250)     
    @user_team = current_user.primary_team
    #get_teams_from_espn
    #move_date_node
    check_schedule
    return
  end
  
  ####SPECIAL

  def get_current_city
    current_user
    user = User.find(current_user.id) 
    @city = current_user.city
    @state = current_user.state
    return 
  end


  #may deprecate. source doesnt retun anything im using right now. Also, dup of JS function.
  # def get_teams_from_espn
  #   response = HTTParty.get('http://api.espn.com/v1/sports/soccer/usa.1/teams/links/web/?apikey=4u3e6enmscdszh8qcy9dh7my')
  #   @response = response["sports"][0]["leagues"][0]["teams"]
  #   respond_to do |format|
  #     format.html
  #     format.json { render :xml => @response.to_json }
  #   end

  #   return

  # end


  def get_current_time
    #replace later with more specific params...
    @time = Time.now
    @tomorrow = Chronic.parse('tomorrow')
    @today =  @time.strftime("%A, %B %d, %Y").inspect
    return [@time, @today]   
  end



=begin

  #check_schedule:
  this checks MLS schedule and see whether game is listed for the user's primary team.
  if the team is listed, then it will next check current time and compare that to the team's match date.
  time to match determines what kind of content will appear in match_day method.

    #alt for mls schedule: "http://espnfc.com/fixtures/_/league/usa.1/major-league-soccer?" 
    #url_nasl = "http://www.nasl.com/index.php?id=12"
    #url_usl = "http://uslpro.uslsoccer.com/schedules/"

=end

 def match_preview
    @user_team = current_user.primary_team
    flash[:alert] = "PREVIEW"
  end

  def match_day
    @user_team = current_user.primary_team
    flash[:alert] = "ITS MATCH DAY for #{@my_team}"
  end

  def get_source
    url_mls = "http://www.mlssoccer.com/schedule"
  end

  def move_date_node

    #moves date inside it's corresponding table. For some reason they put it outside of corresponding games container.
  
  end


  def check_schedule

    url_mls = "http://www.mlssoccer.com/schedule"

    #scrape source
    @schedule_array = Nokogiri::HTML(open(url_mls)).css('.schedule-page .schedule-table tbody tr').to_a

    #get current date
    today = Time.now.strftime('%Y-%m-%d')
    @today = today
  
=begin
  
1. on page load, we get the full schedule immediately. User's primary team is likely on there, but need to add if/else in case it's offseason or edge case. (hardcode excluded months? restrict to league schedule? or include all dates?...hmmm)

=end
  

    #parse dates, should be getting an array of dates objects here. 
    match_date = Chronic.parse("September 10, 2013").strftime('%Y-%m-%d')


    #get team name from db for comparison to scrape
    my_team = current_user.primary_team.split(' ').map(&:strip)
    @my_team = my_team[0]
    
    #@my_team = 'Seattle'

    if @schedule_array.include?(@my_team)
      match_day
    else
      match_preview
    end
    
  

  end

  # #basic CRUD - will use when setting up individual user profile pages. Right now, index acts as user profile in that it shows location based view
  
  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def user_params
    params.require(:user).permit!
  end
  def teams_params
    params.require(:team).permit!
  end


end