User.delete_all
Slide.delete_all
Team.delete_all



t1 = Team.create!(:name => 'Seattle Sounders FC', :venue => 'CenturyLink Field', :address=> '6800 Occidental Ave S, Seattle, WA', :city =>'Seattle',:state => 'WA',:league =>'MLS', :image => 'http://upload.wikimedia.org/wikipedia/commons/6/68/Soundersfcqwestfield.jpg')
t2 = Team.create!(:name=>'New York Red Bulls', :venue=> 'Red Bull Arena, Harrison, NJ', :address => '600 Cape May St, Harrison, NJ', :city =>'Harrison',:state=>'NJ', :league=>'MLS', :image => 'http://www.topdrawersoccer.com/the91stminute/wp-content/uploads/2013/05/NYC.jpg')
t3 = Team.create!(:name =>'LA Galaxy', :venue => 'StubHub Center', :address =>'18400 S Avalon Blvd, Carson, CA 90746', :league =>'MLS', :image => 'http://www.soccerbyives.net/images/2012/12/RobbieKeanePK-ISIPhotos.com_.jpg')
t4 = Team.create!(:name =>'Colorado Rapids', :venue => 'Dick\'s Sporting Goods Park', :address =>'6000 Victory Way, Commerce City, CO 80022', :league =>'MLS', :image => 'http://www.coloradorapids.com/sites/colorado/files/imagecache/620x350/image_nodes/2011/02/Tickets%20On%20Sale%20Now%20DL.jpg')
t5 = Team.create!(:name =>'Houston Dynamo', :venue => 'BBVA Compass Stadium', :address =>'2200 Texas Ave, Houston, TX 77003', :league =>'MLS', :image => 'http://www.mlssoccer.com/sites/league/files/imagecache/620x350/image_nodes/2012/05/bbva_0.jpg')#http://www.lagalaxy.com/sites/losangeles/files/imagecache/620x350/image_nodes/2012/05/bbva_compas_stadium.jpg
t6 = Team.create!(:name =>'Portland Timbers', :venue => 'Jeld-Wen Field', :address =>'2200 Texas Ave, Houston, TX 77003', :league =>'MLS', :image => 'http://ts-sports.com/wp-content/uploads/2011/08/article_home_jeldwen.jpg')
t7 = Team.create!(:name =>'San Jose Earthquakes', :venue => 'Buck Shaw Stadium', :address =>'500 El Camino Real, Santa Clara, CA 95050', :league =>'MLS', :image => 'http://static.foxsports.com/content/fsc/img/2013/02/26/San-Jose-Earthquakes-Chris-Wondolowski-_20130226162930612_660_320.JPG')
t8 = Team.create!(:name =>'Philadelphia Union', :venue => 'PPL Park', :address =>'1 Stadium Dr, Chester, PA 19013', :league =>'MLS', :image => 'http://www.uwishunu.com/wp-content/uploads/2010/10/ppl-park-chester-680uw.jpg')
t9 = Team.create!(:name =>'New England Revolution', :venue => 'Gillette Stadium', :address =>'1 Patriot Pl, Foxboro, MA 02035', :league =>'MLS', :image => 'http://www.revolutionsoccer.net/sites/newengland/files/imagecache/620x350/image_nodes/2011/01/2011_gillettestadium.jpg')
t10 = Team.create!(:name =>'Chicago Fire', :venue => 'Toyota Park', :address =>'7000 S Harlem Ave, Bridgeview, IL 60455', :league =>'MLS', :image => 'http://i.imgur.com/6fCVN.jpg')
t11 = Team.create!(:name =>'Colombus Crew', :venue => 'Colombus Crew Stadium', :address =>'1 Black and Gold Blvd, Columbus, OH 43211', :league =>'MLS', :image => 'http://www1.pictures.zimbio.com/gi/Federico+Higuain+Toronto+FC+v+Columbus+Crew+VAMI7H3D8s1l.jpg')
t12 = Team.create!(:name =>'Toronto FC', :venue => 'BMO Field', :address =>'170 Princes\' Blvd, Toronto, ON M6K 3C3, Canada', :league =>'MLS', :image => 'http://upload.wikimedia.org/wikipedia/commons/8/89/East-stand-supporters-section-bmo-field.jpg')
t13 = Team.create!(:name =>'Chivas USA', :venue => 'StubHub Center', :address =>'18400 S Avalon Blvd, Carson, CA 90746', :league =>'MLS', :image => 'http://upload.wikimedia.org/wikipedia/commons/7/75/HomeDepotCenter1.jpg')
t14 = Team.create!(:name =>'Colorado Rapids', :venue => 'Dick\'s Sporting Goods Park', :address =>'6000 Victory Way, Commerce City, CO 80022', :league =>'MLS', :image => 'http://www.denver.org/images/memberimages/Cropped_553x300/1793_ColoradoRapids.jpg')
t15 = Team.create!(:name =>'FC Dallas', :venue => 'FC Dallas Stadium', :address =>'9200 World Cup Way, Ste 202
Frisco, TX 75034-4958', :league =>'MLS', :image => 'http://es.fifa.com/mm//Photo/WorldFootball/ClubFootball/01/66/84/26/1668426_FULL-LND.jpg')
t16 = Team.create!(:name =>'Real Salt Lake', :venue => 'Rio Tinto Stadium', :address =>'9256 S State St, Sandy, UT 84070', :league =>'MLS', :image => 'http://upload.wikimedia.org/wikipedia/commons/f/fe/0811_-_Rio_Tinto_Stadium.jpg')
t17 = Team.create!(:name =>'Vancouver Whitecaps', :venue => 'BC Place', :address =>'777 Pacific Blvd, Vancouver, BC V6B 4Y8, Canada', :league =>'MLS',  :image => 'http://upload.wikimedia.org/wikipedia/commons/4/42/BC_Place_Opening_Day_2011-09-30.jpg')
t18 = Team.create!(:name =>'Montreal Impact', :venue => 'Stade Saputo', :address =>'4750 Rue Sherbrooke Est, Montreal, QC H1V 3S8', :league =>'MLS',  :image => 'http://upload.wikimedia.org/wikipedia/commons/6/69/2012_Impact_de_Montr%C3%A9al_au_stade_Saputo.jpg')
t19 = Team.create!(:name =>'Sporting Kansas City', :venue => 'Sporting Park', :address =>'1 Sporting Way, Kansas City, KS 66111', :league =>'MLS',:image => 'http://upload.wikimedia.org/wikipedia/commons/6/67/Livestrong_Sporting_Park_-_Sporting_KC_v_New_England_Revolution.jpg')
# t20 = Team.create!(:name =>'NYC FC', :venue => 'TBD', :address =>'TBD', :league =>'MLS')