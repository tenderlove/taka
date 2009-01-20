module Nokogiri
  module XML
    class NamedNodeMap
      def initialize datasource
        @datasource = datasource
      end

      def [](k)
        @datasource[k].to_s
      end

      def []= k,v
        @datasource[k].parent[k] = v
      end

      def each(&blk)
        @datasource.each do |k,v|
          blk.call(k, self[k])
        end
      end

      def getNamedItem name
        @datasource[name]
      end

      def item index
        @datasource[self.keys[index]]
      end

      def method_missing(*args, &block)
        @datasource.send(*args, &block)
      end
    end
  end
end
