user_list = [
  ["C0000001", :instructor, "Instructor", "Account"]]

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
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  