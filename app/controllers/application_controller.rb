require 'twitter'

class ApplicationController < ActionController::Base
  protect_from_forgery

	def list
		@tweets = Twitter.user_timeline("@Launch48")
	end
end

