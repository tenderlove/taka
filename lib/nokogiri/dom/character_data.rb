module Nokogiri
  module DOM
    module CharacterData
      def data
        content
      end

      def data=(_)
        raise(NotImplementedError.new)
      end

      def length
        raise(NotImplementedError.new)
      end

      def substringData(offset, count)
        raise(NotImplementedError.new)
      end

      def appendData data
        self.content = "#{content}#{data}"
      end

      def insertData(offset, arg)
        raise(NotImplementedError.new)
      end
      def deleteData(offset, count)
        raise(NotImplementedError.new)
      end
      def replaceData(offset, count, arg)
        raise(NotImplementedError.new)
      end
    end
  end
end
