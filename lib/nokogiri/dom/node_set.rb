module Nokogiri
  module DOM
    module NodeSet
      def item index
        self.[](index)
      end

      def length
        raise(NotImplementedError.new)
      end
    end
  end
end
