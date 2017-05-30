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
  ["C0000003", :student, "firstname", ""],
  ["C0000004", :student, "", "lastname"],
  ["C0000005", :student, "firstname", "lastname"],
  ["C0000006", :student, "man", "dood"],
  ["C0000007", :student, "sad", "boy"],
  ["C0000008", :student, "derg", "hiut"],
  ["C0000009", :student, "aksr", "lop"],
  ["C0000010", :student, "rateq", "lokm"]]

queue_types = [:question, :demo, :support]

request_info = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer
  imperdiet dignissim arcu, sit amet feugiat ex sagittis at. Cras faucibus nec 
  urna sed maximus. Proin placerat, nulla in ultriciestristique, velit elit 
  finibus diam, a tempus urna tellus a ante."
  
user_list.each do |camosun_id, role, first_name, last_name|
  user = User.create(camosun_id: camosun_id, role: role, first_name: first_name,
    last_name: last_name)
  Request.create(user_id: user.id, queue_type: queue_types.sample, 
    info: request_info)
end
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  