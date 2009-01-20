module Nokogiri
  module DOM
    module NodeSet
      def item index
        self.[](index)
      end
    end
  end
end
