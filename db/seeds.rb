User.delete_all
Slide.delete_all
Team.delete_all


t1 = Team.create!(:name => 'Seattle Sounders FC', :venue => 'CenturyLink Field', :address=> '6800 Occidental Ave S, Seattle, WA', :city =>'Seattle',:state => 'WA',:league =>'MLS')
t2 = Team.create!(:name=>'New York Red Bulls', :venue=> 'Red Bull Arena, Harrison', :address => '600 Cape May St, Harrison, NJ', :city =>'Harrison',:state=>'NJ', :league=>'MLS')
t3 = Team.create!(:name =>'LA Galaxy', :venue => 'StubHub Center', :address =>'18400 S Avalon Blvd, Carson, CA 90746', :league =>'MLS')
t4 = Team.create!(:name =>'Colorado Rapids', :venue => 'Dick\'s Sporting Goods Park', :address =>'6000 Victory Way, Commerce City, CO 80022', :league =>'MLS')
t5 = Team.create!(:name =>'Houston Dynamo', :venue => 'BBVA Compass Stadium', :address =>'2200 Texas Ave, Houston, TX 77003', :league =>'MLS')
t6 = Team.create!(:name =>'Portland Timbers', :venue => 'Jeld-Wen Field', :address =>'2200 Texas Ave, Houston, TX 77003', :league =>'MLS')
t7 = Team.create!(:name =>'San Jose Earthquakes', :venue => 'Buck Shaw Stadium', :address =>'500 El Camino Real, Santa Clara, CA 95050', :league =>'MLS')
t8 = Team.create!(:name =>'Philadelphia Union', :venue => 'PPL Park', :address =>'1 Stadium Dr, Chester, PA 19013', :league =>'MLS')
t9 = Team.create!(:name =>'New England Revolution', :venue => 'Gillette Stadium', :address =>'1 Patriot Pl, Foxboro, MA 02035', :league =>'MLS')
t10 = Team.create!(:name =>'Montreal Impact', :venue => 'Stade Saputo', :address =>'4750 Rue Sherbrooke Est, Montreal, QC H1V 3S8', :league =>'MLS')


@teams = [t1,t2,t3,t4,t5,t6,t7,t8,t9,t10]