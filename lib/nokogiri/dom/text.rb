module Nokogiri
  module DOM
    module Text
      def splitText index
        left = text[0..(index - 1)]
        right = text[index..-1]
        self.content = left
        self
      end
    end
  end
end
