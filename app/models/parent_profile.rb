class ParentProfile < ActiveRecord::Base

	has_many :users, :as => :profilable

end
