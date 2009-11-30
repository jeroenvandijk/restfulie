module Restfulie
  module Client
    module Base
      
      # configures an entry point
      def entry_point_for
        @entry_points = EntryPointControl.new(self) unless @entry_points
        @entry_points
      end
      
      # executes a POST request to create this kind of resource at the server
      def remote_create(content)
        content = content.to_xml unless content.kind_of? String
        remote_post content
      end

      private
      def remote_post(content)
        url = URI.parse(entry_point_for.create.uri)
        req = Net::HTTP::Post.new(url.path)
        req.body = content
        req.add_field("Accept", "application/xml")

        Net::HTTP.new(url.host, url.port).request(req)
      end
      
    end
    
    class EntryPointControl
      
      def initialize(type)
        @type = type
        @entries = {}
      end
      
      def method_missing(name, *args)
        @entries[name] = EntryPoint.new unless @entries[name]
        @entries[name]
      end

    end
    
    class EntryPoint
      attr_accessor :uri
      def at(uri)
        @uri = uri
      end
    end
    
  end
end
