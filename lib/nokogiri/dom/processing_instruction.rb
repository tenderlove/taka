module Nokogiri
  module DOM
    module ProcessingInstruction
      def attributes
        nil
      end

      def target
        name
      end

      def data
        content
      end
    end
  end
end
