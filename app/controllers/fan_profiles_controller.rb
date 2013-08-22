  class FanProfilesController < ApplicationController 

  # def set_access_control_headers
  #   response.headers["Access-Control-Allow-Origin"] = "http://localhost:3000/"
  #   response.headers["Access-Control-Request-Method"] = "*"
  #   response.headers["Access-Control-Allow-Headers"] = "Content-Type"
  #   response.headers["Content-Type"] = "application/json, text/html"
  # end
  
  # uncomment for localhost testing
  # skip_before_filter :authenticate_user!
  before_filter :authenticate_user!, :except => [:index]


  require 'active_support/all'
  require 'nokogiri'
  require 'open-uri'
  require 'httparty'

  def index
    current_user
    @teams = Team.all
    @users = User.all
    #match day
    show_match_info
    #standard
    show_weather
    show_leagues
    show_news

# @teams = Team.near([@user.latitude, @userocation_info.longitude], 50)

  @myteams = Team.near([current_user.latitude,current_user.longitude], 60)
  
  end

  def show
  #future use - individual user profile pages
  end

####SPECIAL
  def get_current_time
    #basic time for testing - replace later with specific time params...
    @time = Time.now
    @today =  @time.strftime("%A, %B %d, %Y").inspect
    return [@time, @today]   
  end

#prefer to handle with AJAX /JSON but no access to ESPN schedule API. So scraping.
  def get_team
    #where do I get this? Work with the ESPN API?   
    response = HTTParty.get("http://api.espn.com/v1/sports/soccer/usa.1/teams?apikey=4u3e6enmscdszh8qcy9dh7my")
    puts response.body, response.code, response.message, response.headers.inspect
    @team_hash = JSON(response) 

    # respond_to do |format|
    #   format.json render :partial => "fan_profiles/get_team.json"
    # end
    return
  end


  def get_schedules
    #get the users team id(s) from the dataset that was retrieved via API
    #scrape the espn site for schedule info (was not available via API)
    get_current_time
    #parse teams
    
    url_mls = "http://espnfc.com/fixtures/_/league/usa.1/major-league-soccer?"
    # url_nasl = "http://www.nasl.com/index.php?id=12"
    # url_usl = "http://uslpro.uslsoccer.com/schedules/"
    
    @schedule_mls = Nokogiri::HTML(open(url_mls)).css('#my-teams-table * tr.stathead').to_html
    # @schedule_nasl = Nokogiri::HTML(open(url_nasl)).css('body').to_html
    # @schedule_usl = Nokogiri::HTML(open(url_usl)).css('body * div#schedule').inner_html
    @schedules =[@schedule_mls]#,@schedule_nasl, @schedule_nasl
    return
  end

  def get_current_city
    #get value stored in User model
    user = User.find(current_user.id) 
    puts user  
    @city = current_user.city
    @state = current_user.state
    puts @city
    return 
  end

  def show_weather
  	current_user
  	state = current_user.state
  	city = current_user.city
    #formatted_state = current_user.state.gsub!(/\b\s\b/, "+").gsub!(/\b/, "")
    #formatted_state = state.gsub!(/ /,"")
    #formatted_city = current_user.city.gsub!(/ /, "%20")
    weather = Nokogiri::HTML(open("http://weather.weatherbug.com/#{state}/#{city}-weather.html")).css("#divTemp").text
    #weather = Nokogiri::HTML(open("http://weather.weatherbug.com/NY/New%20York-weather.html")).css("#divTemp").text
    @weather = weather
  	return
  end

  # info coming in to client directly....perhaps should move to server side processing.
  def show_leagues
    @leagues = "showing leagues"
 		return
  end

  # info coming in to client directly....perhaps should move to server side processing.
  def show_news
  	@news = "showing news"
  	return
  end


  def show_match_day
      flash[:alert] = "Dates match. Showing ALL games for this day. Need to filter so it only returns USERS area."
  end

  def show_match_highlights
      flash[:alert] = "No matches today. Sorry! Here's some other stuff."
  end


  #MAIN LOGIC.
  # 1. DETERMINE DAY
  # 2. LOOK AT SCHEDULE (schedule method gets users team)
  # 3. IF DAY AND SCHEDULE MATCH... DO SONE THING IF NOT DO ANOTHER 

  def show_match_info

    get_team
    get_current_time
    get_schedules

    # looks at whole schedule, if anything includes the users'  current  system time,
    if @schedule_mls.include?(@today)
        show_match_day
    elsif
        show_match_highlights
    else
        flash[:alert] = "Piss off wanker"
    end

    # looks at time first, then will look at teams
    #   if @time.year == 2013 #if current day == (match_day <= 3)
    #     show_match_upcoming
    #   elsif @time.year == 2014  #elsf current_day == (match.day >=3)
    #     show_match_highlights  
    #   else
    #     #temp
    #     flash[:notice]  ='Offseason! Check back later!'
    #   end

end


  private
  def user_params
    params.require(:user).permit!
  end
  def teams_params
    params.require(:team).permit!
  end


end
