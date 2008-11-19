module Nokogiri
  module DOM
    module Document
      def getElementsByTagName name
        css(name)
      end

      def doctype
        internal_subset
      end

      def implementation
        raise(NotImplementedError.new)
      end

      def documentElement
        document
      end

      def createElement(tagName)
        raise(NotImplementedError.new)
      end

      def createDocumentFragment
        raise(NotImplementedError.new)
      end

      def createTextNode(data)
        raise(NotImplementedError.new)
      end

      def createComment(data)
        XML::Comment.new(self, data)
      end

      def createCDATASection(data)
        XML::CDATA.new(self, data)
      end

      def createProcessingInstruction(target, data)
        raise(NotImplementedError.new)
      end
      def createAttribute(name)
        raise(NotImplementedError.new)
      end
      def createEntityReference(name)
        raise(NotImplementedError.new)
      end
      def importNode(importedNode, deep)
        raise(NotImplementedError.new)
      end
      def createElementNS(namespaceURI, qualifiedName)
        raise(NotImplementedError.new)
      end
      def createAttributeNS(namespaceURI, qualifiedName)
        raise(NotImplementedError.new)
      end
      def getElementsByTagNameNS(namespaceURI, localName)
        raise(NotImplementedError.new)
      end
      def getElementById(elementId)
        raise(NotImplementedError.new)
      end
      def inputEncoding
        raise(NotImplementedError.new)
      end
      def xmlEncoding
        raise(NotImplementedError.new)
      end
      def xmlStandalone
        raise(NotImplementedError.new)
      end
      def xmlStandalone=(_)
        raise(NotImplementedError.new)
      end
      def xmlVersion
        raise(NotImplementedError.new)
      end
      def xmlVersion=(_)
        raise(NotImplementedError.new)
      end
      def strictErrorChecking
        raise(NotImplementedError.new)
      end
      def strictErrorChecking=(_)
        raise(NotImplementedError.new)
      end
      def documentURI
        raise(NotImplementedError.new)
      end
      def documentURI=(_)
        raise(NotImplementedError.new)
      end
      def adoptNode(source)
        raise(NotImplementedError.new)
      end
      def domConfig
        raise(NotImplementedError.new)
      end
      def normalizeDocument
        raise(NotImplementedError.new)
      end
      def renameNode(n, namespaceURI, qualifiedName)
        raise(NotImplementedError.new)
      end
    end
  end
end
