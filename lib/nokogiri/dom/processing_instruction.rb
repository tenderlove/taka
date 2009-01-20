module Nokogiri
  module DOM
    module ProcessingInstruction
      def target
        name
      end

      def data
        content
      end
    end
  end
end
