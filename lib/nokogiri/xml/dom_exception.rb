module Nokogiri
  module XML
    class DOMException < StandardError
      HIERARCHY_REQUEST_ERR = 0

      attr_accessor :code

      def initialize code, message = nil
        @code = code
        super(message)
      end
    end
  end
end
