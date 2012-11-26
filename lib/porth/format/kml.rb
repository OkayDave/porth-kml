module Porth
  module Format
    module KML
      def self.call controller, object
        kml = object
        kml.render
      end

      module ControllerExtensions
        protected

        # no extensions required for this one.
      end
    end
  end
end
