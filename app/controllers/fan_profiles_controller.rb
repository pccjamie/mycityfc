class FanProfilesController < ApplicationController

  before_filter :authenticate_user!# :except => [:index]

  require 'active_support/all'
  require 'nokogiri'
  require 'open-uri'
  require 'httparty'
  require 'chronic'

  def index
    current_user
    @users = User.all
    # @teams = Team.all
    current_user.primary_team
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

    # YT USERNAME (HARDCODED. NEED TO MAP THIS TO USERS PREFERRED TEAM AND THEN BE ABLE TO QUERY THAT RELATIONSHIP

    # some_team = current_user.primary_team.split(' ').map(&:strip) # DOES NOT WORK FOR SOMETHING LIKE FC DALLAS or CHIVAS USA
    # @some_team = some_team
    current_team = current_user.primary_team.strip
    @current_team = current_team
    yt_base = "https://www.googleapis.com/youtube/v3"
    yt_key = "AIzaSyDRWryJz70D_ybAHQmhuiwgrHtYOuEo9tA" #ADD TO ENVCFGVAR

    #array of teams
    yt_users = Nokogiri::HTML(open("http://www.youtube.com/user/mls/about")).css('ul.channel-summary-list * .yt-lockup-title a').to_a
    @yt_users = yt_users
    #for each team, get the team name and href value
    yt_users.each do |t|
      #return single team name
      yt_team = t.text
      yt_team = yt_team.strip
      @yt_team = yt_team
      # mypatt = /href=\D\/user\/\D*"/i
      yt_user = t.attributes['href'].to_s
      yt_username = yt_user.gsub('/user/','')
      @yt_username = yt_username

      if current_team == yt_team
        flash[:notice] = "#{current_team} is found on Youtube. Passed #{yt_username} to YT call"     
        #pass the username into youtube.channels.list
        response = HTTParty.get("#{yt_base}/channels?part=id%2C+snippet&forUsername=#{yt_username}&key=#{yt_key}")
        #get ch id from the response
        channel_id = response["items"][0]["id"]
        #get ch info from id
        channel_info = HTTParty.get("#{yt_base}/search?part=id%2C+snippet&channelId=#{channel_id}&maxResults=2&order=date&key=#{yt_key}")
        #gets vid IDs from ch info
        @video_ids = []
        channel_info["items"].each do |item|
          @video_ids.push(item["id"]["videoId"])
        end

      else
        #flash[:notice] = "No videos found for #{current_team} "
        # response = HTTParty.get("#{yt_base}/channels?part=id%2C+snippet&forUsername=mls&key=#{yt_key}")
      end

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
      # format.json { render :json => @videos.to_html }
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

  def get_user_team_info

    #get users team and sends to DOM, where it's used in schedule filtering.
    my_team = current_user.primary_team.split(' ').map(&:strip) # DOES NOT WORK FOR SOMETHING LIKE FC DALLAS or CHIVAS USA, or NEW ENGLAND / NEW YORK
    
    #trying to account for team names with shared words. Like New England, New York,  FC Dallas, FC something else, etc...
    

    if my_team.include?("New" || "FC")
      @my_team = my_team[0..1].to_s
    else
      @my_team = my_team[0] 
    end
    
    #SEPARATE
    #send schedule to DOM for filtering
    year = Chronic.parse('this year').strftime('%Y')  #allows for new year to be passed in. In US soccer, MLS season does not overlap years, so this works.
    month = Chronic.parse('this month').strftime('%m')  
    
    url_mls = "http://www.mlssoccer.com/schedule?month=#{month}&year=#{year}&club=all&competition_type=all&broadcast_type=all&op=Search&form_id=mls_schedule_form"
    schedule_array = Nokogiri::HTML(open(url_mls)).css('.schedule-table tbody tr').to_a
    #@my_teams_results = "http://www.mlssoccer.com/schedule?month=all&year=#{this_year}&club=#{my_team}&competition_type=all&broadcast_type=all&op=Search&form_id=mls_schedule_form"

    @schedule = schedule_array

  end

  #gets team names from espn db automatically (not doing anything with this yet)
  # def get_teams_from_espn
  #   response = HTTParty.get('http://api.espn.com/v1/sports/soccer/usa.1/teams/links/web/?apikey=4u3e6enmscdszh8qcy9dh7my')
  #   @response = response["sports"][0]["leagues"][0]["teams"]
  #   respond_to do |format|
  #     format.html
  #     format.json { render :xml => @response.to_json }
  #   end
  #   return
  # end

  private
  def user_params
    params.require(:user).permit!
  end
  def teams_params
    params.require(:team).permit!
  end

end