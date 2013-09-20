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
  #require 'httparty'
  require 'chronic'

  def index
    current_user
    @users = User.all
    @teams = Team.all
    @nearby_teams = Team.near([current_user.latitude,current_user.longitude], 250)    
    #get_teams_from_espn
    get_team
    get_video_from_youtube
    match_preview
    match_day
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


    
    #get_team

    # for each team in team DB, match
  def get_video_from_youtube

    @videos = HTTParty.get('http://www.youtube.com/user/soundersfcdotcom/videos')

    
    respond_to do |format|
      format.html
      # format.json { render :xml => @response.to_json }
    end
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


  def get_time
    #replace later with more specific params...
    @time = Time.now
    @tomorrow = Chronic.parse('tomorrow')
    @yesterday = Chronic.parse('yesterday')
    @today =  @time.strftime("%A, %B %d, %Y").inspect
    return [@time, @today, @tomorrow, @yesterday]   
  end


 def match_preview
    #flash[:alert] = "PREVIEW"
  end

  def match_day
    #flash[:alert] = "ITS MATCH DAY for #{@formatted_team}"
  end

  def get_source
    # scraping is not preferred, source html could change and break this app. this is temp for POC. need API or more reliable solution
    url_mls = "http://www.mlssoccer.com/schedule"
    #alt for mls schedule: "http://espnfc.com/fixtures/_/league/usa.1/major-league-soccer?" 

  end


  def get_team

    #as written, assumes  1) user's team IS in fact on the schedule page, and 2) source is formatted a certain way. WRITE CODE TO ACCOUNT FOR OTHER...

    #scrape
    schedule_array = Nokogiri::HTML(open(get_source)).css('.schedule-page .schedule-table tbody tr').to_a

    #get team name from db for comparison
    my_team = current_user.primary_team.split(' ').map(&:strip)
    
    @formatted_team = my_team[0] #formats for easier comparison to scrape.
    #@formatted_team = "New York"

    #filter results for my team here? client side? Currently, results are sent to client and filtered there based on DOM value. Move to server side somehow. 


    #finds game date and formats time. not for display in view, but for comparison on server to filter out past dates and also to determine which game state to show.
    schedule_array.each do |date|
      game_date = date.css('.schedule-page h3').text
      @game_date = Chronic.parse(game_date)#.strftime('%Y-%m-%d')
    end

    # schedule_array.each do |logo|
    #   game_date = date.css('.schedule-page h3').text
    #   @game_date = Chronic.parse(game_date)#.strftime('%Y-%m-%d')
    # end


    #get current date

    #compares the two
    if schedule_array.include?(@today)
      match_day
    else
      match_preview
    end
    
    @schedule = schedule_array

  end


  private
  def user_params
    params.require(:user).permit!
  end
  def teams_params
    params.require(:team).permit!
  end


end