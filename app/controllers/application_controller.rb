require 'twitter'

class ApplicationController < ActionController::Base
  protect_from_forgery

	def list
		@tweets = Twitter.user_timeline("@Launch48")
	end
	
	def places
		@places = Twitter.places_nearby(:ip => "144.82.250.184")
	end
end

