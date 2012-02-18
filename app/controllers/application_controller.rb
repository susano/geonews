require 'twitter'

class ApplicationController < ActionController::Base
  protect_from_forgery
  	def after_initialize
  		Twitter.configure do |config|
  			config.consumer_key = 'AC34dB3nkzpLrJy3T4w'
			config.consumer_secret = 'h1zbWL0jJxksPqrAPUuft0H8RvD1SrYkxX3pLcqv7c'
  			config.oauth_token = '60975184-z121haiBlffAnXF30BeB2LYWZ9Uhn22rNR8DE5vvs'
  			config.oauth_token_secret = 'oxoCZSe4hbpSyTiy4WrhYhyVRCIgnoqtOXmmznnwNaA'
		end
  	end

	def list
		@tweets = Twitter.user_timeline("@Launch48")

	end

	
	def places
		@places = Twitter.places_nearby(:ip => "144.82.250.184")
		if @places.length
			@tweets = Twitter.search(
				'people',
				:geocode => places[0].id,
				:rpp => 1)
		end
	end

	def intro
		# TODO
	end

	def main
		# TODO
	end
end
