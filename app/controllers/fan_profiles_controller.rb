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
  require 'pry-rails'

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
    @time = Time.now
    @today =  @time.strftime("%A, %B %d, %Y").inspect
    return [@time, @today]   
  end


  def match_preview
    #@user_team = current_user.primary_team
    flash[:alert] = "PREVIEW"

  end

  def match_day
    #@user_team = current_user.primary_team
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
    
    #set
    url_mls = 'http://www.mlssoccer.com/schedule'
    schedule_mls = Nokogiri::HTML(open(url_mls)).css('.schedule-table').to_html
   
    @schedule = schedule_mls
    #inconsistent team name in the schedule source. strip to just first word in team name prior to seeing there is a DB match.
    my_team = current_user.primary_team.split(' ').map(&:strip)

    @my_team = my_team[0]

    schedule_dates = Nokogiri::HTML(open(url_mls)).css('.schedule-page h3').to_html
  
    if schedule_mls.include?(my_team[0])

      flash[:alert] = "#{@my_team} has a game coming up."
      
      #write code that checks WHEN and decides which set of match info to display
        get_current_time

        @today = 'September 25, 2013'
        
        if schedule_dates.include?(@today)
          #1 if current date matches game date, show ALL game content.
          match_day
        else
          #2 if current date is x days prior to game, show preview ontent
          match_preview
        end

    else
      flash[:alert] = "No games this month - looks like it's offseason...."   
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