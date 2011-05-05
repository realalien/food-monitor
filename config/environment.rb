# Load the rails application
require File.expand_path('../application', __FILE__)

# realalien: try out the Google Map API v3 rails wrapper,
# ref. https://github.com/parolkar/cartographer
CARTOGRAPHER_GMAP_VERSION = 3

# Initialize the rails application
FoodsMonitor::Application.initialize!
