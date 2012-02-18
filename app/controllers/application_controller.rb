require 'twitter'

class ApplicationController < ActionController::Base
  protect_from_forgery

	def list
		@tweets = Twitter.user_timeline("@Launch48")
	end

	def intro
		# TODO
	end

	def main
		# TODO
	end
end

