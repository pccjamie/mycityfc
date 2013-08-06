# class ImageUploadJob

# 	@queue = :image_upload

# 	def self.perform(job_id)   #binding to resque gem

# 		#resque is taking job from queue and runs .perform
# 		p "Uploading image....#{job_id}"
# 		sleep(5)
# 		raise
# 		p "Finished image upload #{job_id}"

# 	end
# end