module Taka
  module DOM
    module Element
      def tagName
        self.name
      end

      def getAttribute(name)
        self[name]
      end

      def setAttribute(name, value)
        if read_only? || [
          Node::TEXT_NODE,
          Node::ENTITY_DECL
        ].include?(type)
          raise DOMException.new(DOMException::NO_MODIFICATION_ALLOWED_ERR)
        end

        if name.length == 0 || name !~ /^\w+$/
          raise DOMException.new(DOMException::INVALID_CHARACTER_ERR)
        end
        self[name] = value
      end

      def removeAttribute(name)
        if read_only?
          raise DOMException.new(DOMException::NO_MODIFICATION_ALLOWED_ERR)
        end
        self.remove_attribute(name)
      end

      def getAttributeNode name
        self.attribute(name)
      end

      def setAttributeNode new_attribute
        if read_only? || [
          Node::TEXT_NODE,
          Node::ENTITY_DECL
        ].include?(type)
          raise DOMException.new(DOMException::NO_MODIFICATION_ALLOWED_ERR)
        end
        old_attribute = self.getAttributeNode(new_attribute.name)
        self[new_attribute.name] = new_attribute.value
        old_attribute
      end

      def removeAttributeNode old_attribute
        remove_attribute old_attribute.name
      end

      def getElementsByTagName(name)
        DOM::NodeList.new do
          css(name)
        end
      end

      def getAttributeNS(namespaceURI, localName)
        raise(NotImplementedError.new)
      end
      def setAttributeNS(namespaceURI, qualifiedName, value)
        raise(NotImplementedError.new)
      end
      def removeAttributeNS(namespaceURI, localName)
        raise(NotImplementedError.new)
      end
      def getAttributeNodeNS(namespaceURI, localName)
        raise(NotImplementedError.new)
      end
      def setAttributeNodeNS(newAttr)
        raise(NotImplementedError.new)
      end
      def getElementsByTagNameNS(namespaceURI, localName)
        raise(NotImplementedError.new)
      end
      def hasAttribute(name)
        raise(NotImplementedError.new)
      end
      def hasAttributeNS(namespaceURI, localName)
        raise(NotImplementedError.new)
      end
    end
  end
end
