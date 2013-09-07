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
    @teams = Team.near([current_user.latitude,current_user.longitude], 600) 
    
    get_teams
    #show_weather
    check_conditions

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

  def get_teams

    response = HTTParty.get('http://api.espn.com/v1/sports/soccer/usa.1/teams/links/web/?apikey=4u3e6enmscdszh8qcy9dh7my')
    @response = response["sports"][0]["leagues"][0]["teams"]
   
    respond_to do |format|
      format.html
      format.json { render :xml => @response.to_json }
    end
    return
  end


  def enter_distance
  end

  def get_current_time
    #basic time for testing - replace later with specific time params...
    @time = Time.now
    @today =  @time.strftime("%A, %B %d, %Y").inspect
    return [@time, @today]   
  end

  def check_schedule
    #get the users team id(s) from the dataset that was retrieved via API
    #scrape the espn site for schedule info (was not available via API)

    get_current_time

    url_mls = "http://espnfc.com/fixtures/_/league/usa.1/major-league-soccer?"
    #url_nasl = "http://www.nasl.com/index.php?id=12"
    #url_usl = "http://uslpro.uslsoccer.com/schedules/"
    
    @schedule_mls = Nokogiri::HTML(open(url_mls)).css('#my-teams-table * tr.stathead').to_html
    # @schedule_nasl = Nokogiri::HTML(open(url_nasl)).css('body').to_html
    # @schedule_usl = Nokogiri::HTML(open(url_usl)).css('body * div#schedule').inner_html
    
    return
  end

  

  def match_day

    flash[:alert] = "Dates match. Showing ALL games for this day. Need to filter so it only returns USERS area."

  end

  def check_conditions

    # run these to determine whether the match day trigger button should appear.
    the_time = get_current_time
    check_schedule

    #1 looks at whole schedule, if anything includes the users'  current  system time,
    #2 check date first

    if @schedule_mls.include?(@today) #or whatever the condition is
      match_day
    else
      flash[:alert] = "No matches today. Piss off, wanker!"
    end

    # looks at datetime first, then will look at teams
    #   if @time.year == 2013 #if current day == (match_day <= 3)
    #     show_match_upcoming
    #   elsif @time.year == 2014  #elsf current_day == (match.day >=3)
    #     show_match_highlights  
    #   else
    #     #temp
    #     flash[:notice]  ='Offseason! Check back later!'
    #   end
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