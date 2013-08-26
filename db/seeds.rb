User.delete_all
Slide.delete_all
Team.delete_all

t1 = Team.create!(:name => 'Seattle Sounders FC', :venue => 'CenturyLink Field', :address=> '6800 Occidental Ave S, Seattle, WA', :city =>'Seattle',:state => 'WA',:league =>'MLS', :image => 'http://upload.wikimedia.org/wikipedia/commons/6/68/Soundersfcqwestfield.jpg')
t2 = Team.create!(:name=>'New York Red Bulls', :venue=> 'Red Bull Arena, Harrison, NJ', :address => '600 Cape May St, Harrison, NJ', :city =>'Harrison',:state=>'NJ', :league=>'MLS', :image => '')
t3 = Team.create!(:name =>'LA Galaxy', :venue => 'StubHub Center', :address =>'18400 S Avalon Blvd, Carson, CA 90746', :league =>'MLS', :image => '')
t4 = Team.create!(:name =>'Colorado Rapids', :venue => 'Dick\'s Sporting Goods Park', :address =>'6000 Victory Way, Commerce City, CO 80022', :league =>'MLS', :image => '')
t5 = Team.create!(:name =>'Houston Dynamo', :venue => 'BBVA Compass Stadium', :address =>'2200 Texas Ave, Houston, TX 77003', :league =>'MLS', :image => 'http://www.mlssoccer.com/sites/league/files/imagecache/620x350/image_nodes/2012/05/bbva_0.jpg')
t6 = Team.create!(:name =>'Portland Timbers', :venue => 'Jeld-Wen Field', :address =>'2200 Texas Ave, Houston, TX 77003', :league =>'MLS', :image => '')
t7 = Team.create!(:name =>'San Jose Earthquakes', :venue => 'Buck Shaw Stadium', :address =>'500 El Camino Real, Santa Clara, CA 95050', :league =>'MLS', :image => '')
t8 = Team.create!(:name =>'Philadelphia Union', :venue => 'PPL Park', :address =>'1 Stadium Dr, Chester, PA 19013', :league =>'MLS', :image => '')
t9 = Team.create!(:name =>'New England Revolution', :venue => 'Gillette Stadium', :address =>'1 Patriot Pl, Foxboro, MA 02035', :league =>'MLS', :image => '')
t10 = Team.create!(:name =>'Chicago Fire', :venue => 'Toyota Park', :address =>'7000 S Harlem Ave, Bridgeview, IL 60455', :league =>'MLS', :image => '')
t11 = Team.create!(:name =>'Colombus Crew', :venue => 'Colombus Crew Stadium', :address =>'1 Black and Gold Blvd, Columbus, OH 43211', :league =>'MLS', :image => '')
t12 = Team.create!(:name =>'Toronto FC', :venue => 'BMO Field', :address =>'170 Princes\' Blvd, Toronto, ON M6K 3C3, Canada', :league =>'MLS', :image => '')
t13 = Team.create!(:name =>'Chivas USA', :venue => 'StubHub Center', :address =>'18400 S Avalon Blvd, Carson, CA 90746', :league =>'MLS', :image => '')
t14 = Team.create!(:name =>'Colorado Rapids', :venue => 'Dick\'s Sporting Goods Park', :address =>'6000 Victory Way, Commerce City, CO 80022', :league =>'MLS', :image => '')
t15 = Team.create!(:name =>'FC Dallas', :venue => 'FC Dallas Stadium', :address =>'9200 World Cup Way, Ste 202
Frisco, TX 75034-4958', :league =>'MLS', :image => '')
t16 = Team.create!(:name =>'Real Salt Lake', :venue => 'Rio Tinto Stadium', :address =>'9256 S State St, Sandy, UT 84070', :league =>'MLS', :image => '')
t17 = Team.create!(:name =>'Vancouver Whitecaps', :venue => 'BC Place', :address =>'777 Pacific Blvd, Vancouver, BC V6B 4Y8, Canada', :league =>'MLS',  :image => '')
t18 = Team.create!(:name =>'Montreal Impact', :venue => 'Stade Saputo', :address =>'4750 Rue Sherbrooke Est, Montreal, QC H1V 3S8', :league =>'MLS',  :image => '')
t19 = Team.create!(:name =>'Sporting Kansas City', :venue => 'Sporting Park', :address =>'1 Sporting Way, Kansas City, KS 66111', :league =>'MLS',:image => '')
# t20 = Team.create!(:name =>'NYC FC', :venue => 'TBD', :address =>'TBD', :league =>'MLS')