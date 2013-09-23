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

 #sample  = HTTParty.get("https://www.googleapis.com/youtube/v3/channels?id=soundersfcdotcom&part=id,snippet,contentDetails&key=AIzaSyDRWryJz70D_ybAHQmhuiwgrHtYOuEo9tA&playlistId=&UUSZbXT5TLLW_i-5W8FZpFsg&key=AIzaSyDRWryJz70D_ybAHQmhuiwgrHtYOuEo9tA")

    #first get the user's teams
    get_team

    #and then based on that get the related youtube URL. Probably need to save URL in datbabase?

    #set key (add to config vars, this is just temp)
    y_key = "AIzaSyDRWryJz70D_ybAHQmhuiwgrHtYOuEo9tA"
    y_user ="soundersfcdotcom"

    #1. FIND CHANNEL IDS FOR EACH TEAM
    #Services > YouTube Data API v3 > youtube.channels.list

    #retrieve the channel for youtube username
    response = HTTParty.get("https://www.googleapis.com/youtube/v3/channels?part=id%2C+snippet&forUsername=#{y_user}&key=#{y_key}")

    #retrieves channel id from the response
    channel_id = response["items"][0]["id"]

    #2. FIND A PLAYLIST FOR THE CHANNEL

    #Services > YouTube Data API v3 > youtube.playlists.list

    channel_id = "UCVhbRUhe_hfmgi-UN1gcQzw"
   
   #all_playlists = HTTParty.get("https://www.googleapis.com/youtube/v3/channels?part=id%2CcontentDetails&forUsername=#{teamurl}&maxResults=3&key=#{key}")


   # response2 = HTTParty.get("https://www.googleapis.com/youtube/v3/playlists?part=id%2Csnippet&channelId=#{channel_id}&key=#{key}")

   #  #should retrieve uploads playlist for this channel
   #  playlist_id = response2["items"][0]["id"]


    #2. FIND ALl VIDEOS FOR THE CHANNEL ID

    @videos = HTTParty.get("https://www.googleapis.com/youtube/v3/search?part=id%2C+snippet&channelId=#{channel_id}&maxResults=5&order=date&key=#{y_key}")


    #https://www.googleapis.com/youtube/v3/search?part=id%2C+snippet&channelId=UCVhbRUhe_hfmgi-UN1gcQzw&maxResults=5&order=date&key=AIzaSyDRWryJz70D_ybAHQmhuiwgrHtYOuEo9tA



    #pass this var that is passed into a second json call, which we need to pass into the new URL which will look for the videos for that channel. 

   







    respond_to do |format|
      format.html
      format.json { render :json => @videos.to_html }
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