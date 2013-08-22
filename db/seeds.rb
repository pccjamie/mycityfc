User.delete_all
Slide.delete_all
Team.delete_all


t1 = Team.create!(:name => 'Seattle Sounders FC', :venue => 'CenturyLink Field', :address=> '6800 Occidental Ave S, Seattle, WA', :city =>'Seattle',:state => 'WA',:league =>'MLS')
t2 = Team.create!(:name=>'New York Red Bulls', :venue=> 'Red Bull Arena, Harrison', :address => '600 Cape May St, Harrison, NJ', :city =>'Harrison',:state=>'NJ', :league=>'MLS')
t3 = Team.create!(:name =>'LA Galaxy', :venue => 'StubHub Center', :address =>'18400 S Avalon Blvd, Carson, CA 90746', :league =>'MLS')
t4 = Team.create!(:name =>'Colorado Rapids', :venue => 'Dick\'s Sporting Goods Park', :address =>'6000 Victory Way, Commerce City, CO 80022', :league =>'MLS')
t5 = Team.create!(:name =>'Houston Dynamo', :venue => 'BBVA Compass Stadium', :address =>'2200 Texas Ave, Houston, TX 77003', :league =>'MLS')


@teams = [t1,t2,t3,t4,t5]