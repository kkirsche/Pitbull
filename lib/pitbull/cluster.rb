# The Pitbull module is used to interact with multiple Monit agent instances
module Pitbull
  # The Cluster class is used to build a cluster of Bark nodes
  class Cluster
    attr_reader :nodes
    # Creates the cluster manager
    def initialize(config_path)
      @nodes = Marshal.load(config_path) || []
      @config_path = config_path
    end

    # Add a Bark node to the Pitbull cluster
    #
    # @param node [Hash] **Optional** Use to provide the configuration details
    #   to the Bark client. Bark expects the Monit IP Address as :host,
    #   Monit httpd :port number, the :user and the :pass for credentials.
    # @return [Array] The array of nodes in the cluster
    def add_node(node = {})
      @nodes.push Bark::Client.new node
    end

    def save_cluster
      File.write(@config_path, Marshal.dump(@nodes))
    end
  end
end
