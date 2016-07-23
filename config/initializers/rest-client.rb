require 'rest-client'
RestClient.proxy = ENV["FIXIE_URL"]
response = RestClient.get("http://fixie:tfWfo9dm1qp8Rw2@velodrome.usefixie.com:80")