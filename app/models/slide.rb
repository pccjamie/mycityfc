require 'rake'

class Slide < ActiveRecord::Base

	def self.run_rake(scrape)
    	load File.join(RAILS_ROOT, 'lib', 'tasks', 'scrape.rake')
    	Rake::Task[scrape].invoke
    	Rake::Task[scrape].reenable
	end

end
