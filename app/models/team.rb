class Team < ActiveRecord::Base

has_and_belongs_to_many :users

geocoded_by :address
reverse_geocoded_by :latitude, :longitude
after_validation :geocode, :reverse_geocode,
	:if => lambda{ |obj| obj.address_changed? }

end
