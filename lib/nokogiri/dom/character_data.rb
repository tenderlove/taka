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
        content.length
      end

      def substringData offset, count
        if offset > length || offset < 0 || count < 0
          raise XML::DOMException.new(XML::DOMException::INDEX_SIZE_ERR)
        end
        raise(NotImplementedError.new)
      end

      def appendData data
        self.content = "#{content}#{data}"
      end

      def insertData offset, arg
        if offset < 0 || offset > length
          raise XML::DOMException.new(XML::DOMException::INDEX_SIZE_ERR)
        end
        raise(NotImplementedError.new)
      end

      def deleteData offset, count
        if offset < 0 || count < 0 || offset > length
          raise XML::DOMException.new(XML::DOMException::INDEX_SIZE_ERR)
        end
        raise(NotImplementedError.new)
      end

      def replaceData offset, count, arg
        if offset < 0 || count < 0 || offset > length
          raise XML::DOMException.new(XML::DOMException::INDEX_SIZE_ERR)
        end
        raise(NotImplementedError.new)
      end
    end
  end
end
