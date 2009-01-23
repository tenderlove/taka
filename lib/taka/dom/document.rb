module Taka
  module DOM
    module Document
      def getElementsByTagName name
        prefix = namespaces.keys.first
        path = prefix ? "#{prefix}:#{name}" : name
        DOM::NodeList.new do
          xpath("//#{path}", namespaces)
        end
      end

      def doctype
        internal_subset
      end

      def implementation
        raise(NotImplementedError.new)
      end

      def documentElement
        root
      end

      def attributes
        nil
      end

      def createElement tag_name
        unless tag_name =~ /^\w+$/
          raise Taka::DOMException.new(Taka::DOMException::INVALID_CHARACTER_ERR)
        end
        Nokogiri::XML::Node.new(tag_name, self)
      end

      def createDocumentFragment
        Nokogiri::XML::DocumentFragment.new(self)
      end

      def createTextNode data
        Nokogiri::XML::Text.new(data, self)
      end

      def createComment(data)
        Nokogiri::XML::Comment.new(self, data)
      end

      def createCDATASection(data)
        Nokogiri::XML::CDATA.new(self, data)
      end

      def createProcessingInstruction(target, data)
        Nokogiri::XML::ProcessingInstruction.new(self, target, data)
      end

      def createAttribute name
        unless name =~ /^\w+$/
          raise DOMException.new(DOMException::INVALID_CHARACTER_ERR)
        end
        Nokogiri::XML::Attr.new(self, name)
      end

      def createEntityReference name
        unless name =~ /^\w+$/
          raise DOMException.new(DOMException::INVALID_CHARACTER_ERR)
        end
        Nokogiri::XML::EntityReference.new(self, name)
      end

      def getImplementation
        self
      end

      def hasFeature type, version
        return true if type.downcase == 'xml'
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

      def getElementById element_id
        at(".//*[@id='#{element_id}']")
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

      def decorate node
        nx = Nokogiri::XML
        list = {
          nx::Node     => [DOM::Element, DOM::Node],
          nx::Element  => [DOM::Element, DOM::Node],
          nx::Attr     => [DOM::Element, DOM::Node, DOM::Attr],
          nx::NodeSet  => [DOM::NodeSet],
          nx::Text     => [DOM::Element, DOM::Node, DOM::CharacterData, DOM::Text],
          nx::CDATA    => [DOM::Element, DOM::Node, DOM::Text, DOM::CharacterData],
          nx::ProcessingInstruction => [DOM::Element, DOM::Node, DOM::ProcessingInstruction],
          nx::EntityDeclaration => [DOM::Element, DOM::Node, DOM::EntityDeclaration],
          nx::EntityReference => [DOM::Element, DOM::Node, DOM::EntityReference],
          nx::DTD     => [DOM::Element, DOM::Node, DOM::DTD],
          nx::DocumentFragment => [DOM::Element, DOM::Node, DOM::DocumentFragment],
          nx::Comment => [DOM::Element, DOM::Node, DOM::Comment],
          nx::Notation => [DOM::Element, DOM::Node, DOM::Notation],
        }[node.class]

        raise("Unknown type #{node.class.name}") unless list

        list.each { |mod| node.extend(mod) }
        node
      end
    end
  end
end
