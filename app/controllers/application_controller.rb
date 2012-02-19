require 'twitter'
require 'graticule'
require 'feedzirra'

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

	def places2
		geo
		@tweets = Twitter.search(
			'people',
			:geocode => geo,
			:rpp => 1)
	end
	
	def places
		# can use query:<postcode>
		@places = Twitter.places_nearby(:ip => "144.82.250.184")
		if @places.length
			@tweets = Twitter.search(
				'people',
				:geocode => places[0].id,
				:rpp => 1)
		end
	end

	def showmap
		ady = params['address']
		puts "using this address: "+(ady||'')
 		
 		fixmystreet_url = "http://www.fixmystreet.com/rss/l/"

		geocoder = Graticule.service(:google).new "AIzaSyDGdtL_VrP1nETaHipA2FdeDtu_OPI7V4c"
		@location = geocoder.locate ady

		request_url = fixmystreet_url + @location.latitude.to_s + "," + @location.longitude.to_s
		puts "Loading: "+request_url

		# We rename 'georss:point' as 'geo' so we can read it otherwise it is ignored
		Feedzirra::Feed.add_common_feed_entry_element("georss:point", :as => :geo)

		feed = Feedzirra::Feed.fetch_and_parse(request_url)


		feed.entries.each do |point|
			point.sanitize!
			puts "I found: "+ point.title + " at " + point.geo;
		end
		@fixmystreet = feed.entries

		@tweets = ApplicationHelper::TWEET_EVENTS
		# @tweets = Twitter.search(
		#  	'people',
		#  	query:ady)
	end		 	

	def intro
		# TODO
	end

	def main
		# Try and load data from fixmystreet:

		# TODO
	end
end
