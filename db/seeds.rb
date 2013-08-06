# User.delete_all
Slide.delete_all
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
s1 = Slide.new({:name => 'Youth Soccer Registration'}, {:desc => 'youth soccer stats'},{ :data_url => 'http://www.usyouthsoccer.org/media_kit/keystatistics/' },{:cite => 'US Youth Soccer'})
s2 = Slide.new({:name =>'MLS Attendance vs US Sports'},{ :desc => 'mls vs other sports'}, {:data_url => 'http://en.wikipedia.org/wiki/Major_League_Soccer_attendance#MLS_average_attendance_vs._other_US_major_sports/'},{ :cite => 'Wikipedia'})