# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user_list = [
  ["C0000001", :instructor, "joe", "biden"],
  ["C0000002", :student, "chris", "lastname"],
  ["C0000003", :student, "don", "atello"],
  ["C0000004", :student, "Jon", "Ilre"],
  ["C0000005", :student, "Loke", "Jhequ"],
  ["C0000006", :student, "Daniel", "loken"],
  ["C0000007", :student, "Nick", "Lammy"],
  ["C0000008", :student, "Alex", "Beinet"],
  ["C0000009", :student, "hone", "lope"],
  ["C0000010", :student, "ques", "Ipe"],
  ["C0000011", :student, "Takumi", "Takumi"],
  ["C0000012", :student, "Dylan", "Burton"],
  ["C0000013", :student, "Jack", "Beanstalk"],
  ["C0000014", :student, "Loser", "Dude"]]

queue_types = [:question, :demo, :support]

request_info = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer
  imperdiet dignissim arcu, sit amet feugiat ex sagittis at. Cras faucibus nec 
  urna sed maximus. Proin placerat, nulla in ultriciestristique, velit elit 
  finibus diam, a tempus urna tellus a ante."
  
user_list.each do |camosun_id, role, first_name, last_name|
  user = User.create(camosun_id: camosun_id, role: role, first_name: first_name,
    last_name: last_name)
  unless user.instructor?
    Request.create(user_id: user.id, queue_type: queue_types.sample, 
      info: request_info)
  end
end
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  