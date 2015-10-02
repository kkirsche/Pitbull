# The Pitbull module is used to interact with multiple Monit agent instances
module Pitbull
  # Error when the user does not provide us with the correct configuration file
  class ConfigFileNotDetectedError < StandardError
  end
end
