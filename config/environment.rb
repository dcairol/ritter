# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Ritter::Application.initialize!
Encoding.default_external = Encoding::ASCII_8BIT
Encoding.default_internal = Encoding::ASCII_8BIT
