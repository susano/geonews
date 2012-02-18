
class Event < ActiveRecord::Base

	# get all the events within 'distance' of the (latitude, longitude) point,
	# sorted by increasing distance
	def self.sorted_events_within_distance(latitude, longitude, distance)
		events = Event.find(:all)
		events_distances = events.collect do |e|
			location = e.location
			[e, latitude_longitude_distance(latitude, longitude, location.latitude, location.longitude)]
		end
		
		events_distances.select!{ |e, d| d <= distance }
		events.sort!{ |ed1, ed2| ed1[1] <=> ed2[1] }

		events
	end

private
	# Distance between lat/long of two points, in meters
	def self.latitude_longitude_distance(lat1, long1, lat2, long2)
		r = 6_371_009
		pi180 = Math::PI / 180.0
		phi1, lambda1 = lat1 * pi180, long1 * pi180
		phi2, lambda2 = lat2 * pi180, long2 * pi180

		phi_m = (phi1 + phi2) / 2.0
		delta_phi    = phi2 - phi1
		delta_lambda = lambda2 - lambda1

		r * (delta_phi * delta_phi + (Math::cos(phi_m) * delta_lambda) ** 2.0) ** 0.5
	end
end # ActiveRecord::Base

