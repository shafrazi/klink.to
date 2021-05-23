class Ahoy::Store < Ahoy::DatabaseStore
end

# set to true for JavaScript tracking
Ahoy.api = false
Ahoy.api_only = true
Ahoy.track_bots = true
Ahoy.cookies = false


Ahoy.visit_duration = 30.minutes

# set to true for geocoding
# we recommend configuring local geocoding first
# see https://github.com/ankane/ahoy#geocoding
Ahoy.geocode = true
