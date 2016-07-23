require "rest-client"

RestClient.proxy = ENV["QUOTAGUARDSTATIC_URL"]

res = RestClient.get("http://52.86.18.14.quotaguard.com")

puts "Your Static IP is: 52.86.18.14"