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
    get_teams_from_espn
    #show_weather
    check_schedule

  end
  
  ####SPECIAL

  def get_current_city
    current_user
    user = User.find(current_user.id) 
    @city = current_user.city
    @state = current_user.state
    return 
  end

  def show_weather
    current_user
    # # state = current_user.state
    # # city = current_user.city
   #  state = current_user.state.gsub!(/\b\s\b/, "+").gsub!(/\b/, "")
   #  state = state.gsub!(/ /,"")
   #  city = current_user.city.gsub!(/ /, "%20")
    #weather = Nokogiri::HTML(open("http://weather.weatherbug.com/#{state}/#{city}-weather.html")).css("#divTemp").to_html
    #weather = Nokogiri::HTML(open("http://weather.weatherbug.com/NY/New%20York-weather.html")).css("#divTemp").text
    # weather = Nokogiri::HTML(open("http://weather.weatherbug.com/#{state}/#{city}-weather.html")).css("#divTemp").text
    @weather = weather
    return
  end


  def get_teams_from_espn

    response = HTTParty.get('http://api.espn.com/v1/sports/soccer/usa.1/teams/links/web/?apikey=4u3e6enmscdszh8qcy9dh7my')
    @response = response["sports"][0]["leagues"][0]["teams"]
   
    respond_to do |format|
      format.html
      format.json { render :xml => @response.to_json }
    end
    return

  end


  def get_current_time
    #basic time for testing - replace later with more specific params...
    time = Time.now
    @tomorrow = Chronic.parse('tomorrow')
    @today =  @time.strftime("%A, %B %d, %Y").inspect
    return [@time, @today]   
  end


  def match_preview
    @user_team = current_user.primary_team
    flash[:alert] = "PREVIEW"
  end

  def match_day
    @user_team = current_user.primary_team
    flash[:alert] = "ITS MATCH DAY"
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

  def check_schedule

    #get team name from db for comparison to scrape
    my_team = current_user.primary_team.split(' ').map(&:strip)
    @my_team = my_team[0]
    
    #scrape full for date, game time, home and away team
    url_mls = "http://www.mlssoccer.com/schedule"
    @schedule = Nokogiri::HTML(open(url_mls))
    @schedule.at_css('.schedule-page').text

    #get dates
    #match_dates = Nokogiri::HTML(open(url_mls)).css('.schedule-page h3').to_html.split('</h3><h3>').map(&:strip)

    #move date div inside corresponding table that shows matches. For some reason they put it outside of the table. Stupid!

    # h3  = schedule.at_css ".schedule-page h3"
    # h3['class']='match-date'
    # the_table = schedule.at_css ".schedule-table"
    # h3.parent = the_table

    @schedule.css(".schedule-table").each do |weekend|
      #@game_date = weekend.at_css("h3.match-date").to_html
      @game_time = weekend.at_css(".field-game-date-start-time")
      @home_team = weekend.at_css(".field-home-team")
      @away_team = weekend.at_css(".field-away-team")
      @tv =  weekend.at_css(".broadcast-partners")
      @tickets = weekend.at_css(".sch-tickets") 
    end

    #get current date
    today = Time.now.strftime('%Y-%m-%d')

  
=begin
  
1. on page load, we get the full schedule immediately. User's primary team is likely on there, but need to add if/else in case it's offseason or edge case. (hardcode excluded months? restrict to league schedule? or include all dates?...hmmm)

  if team name is present in the schedule, THEN....

    iterate through schedule. Each weekend is its own table. 

  else

  end


=end
  

    #parse dates, should be getting an array of dates objects here. 
    match_date = Chronic.parse("September 10, 2013").strftime('%Y-%m-%d')

    #valid_dates elements = @schedule.css "[#{@my_team}]"

    
    if (@schedule.include?(my_team[0]))
      match_day
    else
      match_preview
    end
    
    return

  end

  # #basic CRUD - will use when setting up individual user profile pages. Right now, index acts as user profile in that it shows location based view
  
  # def show
  # end

  # def edit
  # end

  # def update
  # end

  # def destroy
  # end

  private
  def user_params
    params.require(:user).permit!
  end
  def teams_params
    params.require(:team).permit!
  end


end