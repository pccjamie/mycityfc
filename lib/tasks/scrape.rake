desc "scrapes data from url"
task :fetch_stats => :environment do
  require 'nokogiri'
  require 'open-uri'  

  Slide.find_each do |slide|
    
    raw_url = slide.data_url
    raw_data = Nokogiri::HTML(open(raw_url)).css('body').to_html
    slide.update_attribute(:data, raw_data)
  
  end

	private
      def slide_params
        params.require(:slide).permit!
      end



end