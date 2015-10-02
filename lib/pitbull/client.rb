# The Pitbull module is used to interact with multiple Monit agent instances
module Pitbull
  # The Client class is used to interact with and run Pitbull
  class Client
    attr_reader :cluster

    def initialize
      homes = ["HOME", "HOMEPATH"]
      home_dir = homes.detect { |h| !ENV[h].nil? }
      @config_path = "#{ENV[home_dir]}/.pitbull.conf"
      unless File.exist? "#{@config_path}"
        File.open("#{@config_path}",  'w+') do |file|
          file.write Marshal.dump([])
        end
      end
    end

    def cluster
      @cluster ||= Pitbull::Cluster.new @config_path
    end
  end
end
