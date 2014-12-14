class WelcomesController < ApplicationController
	require 'open-uri'
  def welcome
  end
  def show_map
  	ip=request.remote_ip #for server
  	ip="14.194.252.77" #for local
  	url=URI.encode("http://ip-api.com/json/"+ip)
  	open(url) do |http|
	  @response = http.read
	  puts "response: #{@response}"
	end
	@hash=JSON.parse @response.gsub('=>', ':')
	puts @hash.inspect
	puts @response.to_json
	if @hash["countryCode"]=="IN"
		@cities=["Mumbai","Pune","Dilhi","Kolhapur"]
	else
		@cities=["US"]
	end
  end
end
