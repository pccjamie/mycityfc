desc "scrapes data from url"
task :fetch_stats => :environment do
  require 'nokogiri'
  require 'open-uri'  

  Slide.find_each do |slide|
    
    # escaped_stat_name = CGI.escape(stat.name)
    raw_url = slide.data_url
    raw_data = Nokogiri::HTML(open(raw_url))
    raw_text = raw_data.css("body").to_html
    slide.update_attribute(:data, raw_text)
  
  end

	# private
 #      def slide_params
 #        params.require(:slide).permit!
 #      end



end