Feature: Fans' home page displays gameday information.
	In order to see game day information for my team
	As a fan
	I want the fans' home page to get and display game information for my team
	Scenario: There is an upcoming match 
	Given that the team in my geographic area has an upcoming match
	When I log in 
	Then I should see an info panel that shows the match information.