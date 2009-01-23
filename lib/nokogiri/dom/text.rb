module Nokogiri
  module DOM
    module Text
      def attributes
        nil
      end

      def splitText index
        if index < 0 || index > length
          raise XML::DOMException.new(XML::DOMException::INDEX_SIZE_ERR)
        end
        left = text[0..(index - 1)]
        right = text[index..-1]
        self.content = left
        self
      end
    end
  end
end
