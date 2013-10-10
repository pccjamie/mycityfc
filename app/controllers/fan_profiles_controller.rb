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
    #get_teams_from_espn
    get_user_team_info
    get_video_from_youtube
    #return
  end

  def get_current_city
    current_user
    user = User.find(current_user.id)
    @city = current_user.city
    @state = current_user.state
    return
  end

  def get_video_from_youtube
    current_user

    #first get the user's teams
    get_user_team_info

    base = "https://www.googleapis.com/youtube/v3"
    y_key = "AIzaSyDRWryJz70D_ybAHQmhuiwgrHtYOuEo9tA" #ADD TO ENVCFGVAR

    # YT USERNAME (HARDCODED. NEED TO MAP THIS TO USERS PREFERRED TEAM AND THEN BE ABLE TO QUERY THAT RELATIONSHIP
    y_user = "soundersfcdotcom"

    #FIND CHANNELS FOR EACH TEAM BASED ON YT USERNAME (youtube.channels.list)

    response = HTTParty.get("#{base}/channels?part=id%2C+snippet&forUsername=#{y_user}&key=#{y_key}")

    #get ch id from the response
    channel_id = response["items"][0]["id"]

    #get ch info from id
    channel_info = HTTParty.get("#{base}/search?part=id%2C+snippet&channelId=#{channel_id}&maxResults=3&order=date&key=#{y_key}")

    #gets vid IDs from ch info
    @video_ids = []
    channel_info["items"].each do |item|
      @video_ids.push(item["id"]["videoId"])
    end

    #this gets the actual video embed html.....but not using. Handling iframe rendering another way.
    # @videos = []
    # @video_ids.each do |id|
    #   source = HTTParty.get("#{base}/videos?part=id,snippet,player&id=#{id}&key=#{y_key}")
    #   a_video  = source["items"][0]["player"]["embedHtml"]
    #   @videos.push(a_video)
    #   #@video_id = id
    # end
  
    respond_to do |format|
      format.html
      format.json { render :json => @videos.to_html }
    end

    return
  end

  def get_time
    #replace later with more specific params...
    @time = Time.now
    @today =  @time.strftime("%A, %B %d, %Y").inspect
    @tomorrow = Chronic.parse('tomorrow')
    @yesterday = Chronic.parse('yesterday')
    return [@time, @today, @tomorrow, @yesterday]
  end


  # def find_schedules

  #   #MLS (alt: "http://espnfc.com/fixtures/_/league/usa.1/major-league-soccer?")
  #   year = Chronic.parse('this year').strftime('%Y')  #allows for new year to be passed in. In US soccer, season does not overlap years.
  #   url_mls = "http://www.mlssoccer.com/schedule?month=all&year=#{year}&club=all&competition_type=all&broadcast_type=all&op=Search&form_id=mls_schedule_form"

  # end


  def get_user_team_info 

    #need to rethink how schedule data is obtained and formatted. Scrape is not ideal. 

    #get users team and sends to DOM, where it's used in schedule filtering.
    my_team = current_user.primary_team.split(' ').map(&:strip) # DOES NOT WORK FOR SOMETHING LIKE FC DALLAS or CHIVAS USA
    @formatted_team = my_team[0]
 
    #get teams schedule. to be passed to DOM for client side handling.
    year = Chronic.parse('this year').strftime('%Y')  #allows for new year to be passed in. In US soccer, season does not overlap years.
    url_mls = "http://www.mlssoccer.com/schedule?month=all&year=#{year}&club=all&competition_type=all&broadcast_type=all&op=Search&form_id=mls_schedule_form"
    schedule_array = Nokogiri::HTML(open(url_mls)).css('.schedule-page .schedule-table tbody tr').to_a
    @schedule = schedule_array

    #get teams youtube username

  end

  #gets team names from espn db automatically (not doing anything with this yet)
  def get_teams_from_espn
    response = HTTParty.get('http://api.espn.com/v1/sports/soccer/usa.1/teams/links/web/?apikey=4u3e6enmscdszh8qcy9dh7my')
    @response = response["sports"][0]["leagues"][0]["teams"]
    respond_to do |format|
      format.html
      format.json { render :xml => @response.to_json }
    end
    return
  end



  private
  def user_params
    params.require(:user).permit!
  end
  def teams_params
    params.require(:team).permit!
  end


end
