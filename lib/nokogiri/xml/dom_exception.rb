module Nokogiri
  module XML
    class DOMException < StandardError
      HIERARCHY_REQUEST_ERR       = 0
      WRONG_DOCUMENT_ERR          = 1
      NOT_FOUND_ERR               = 2
      NO_MODIFICATION_ALLOWED_ERR = 3
      INDEX_SIZE_ERR              = 4
      INVALID_CHARACTER_ERR       = 5

      attr_accessor :code

      def initialize code, message = nil
        @code = code
        super(message)
      end
    end
  end
end
