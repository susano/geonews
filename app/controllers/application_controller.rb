require 'twitter'

class ApplicationController < ActionController::Base
  protect_from_forgery
  	def after_initialize
  		Twitter.configure do |config|
  			config.consumer_key = 'EGqdOAkoapvXWxtOpAf3Bg'
			config.consumer_secret = 'IoaNO6sPKOqKPE5uj7AFcVQE9L40RjrKXIaQBDEOqM'
  			config.oauth_token = '160344744-RBMzDurTvkepdZNYECjWUvsJuNB9Y2E4RHqwpqe5'
  			config.oauth_token_secret = 'iGCOcwGTh6uiOjLIW2pKKMgEGR1KUQKRp4U9szMryFU'
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
