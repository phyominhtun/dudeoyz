require "rest-client"
 
RestClient.proxy = ENV["QUOTAGUARDSTATIC_URL"] if ENV["QUOTAGUARDSTATIC_URL"]
 
res = RestClient.get("http://quotaguard6220:b9c1d6580cc0@us-east-static-01.quotaguard.com:9293")
 
puts "Your IP was: #{res.body}"