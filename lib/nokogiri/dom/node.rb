module Nokogiri
  module DOM
    module Node
      def nodeName
        return '#text' if text?
        return '#comment' if comment?
        return '#document' if self == document
        node_name
      end

      def nodeValue
        return nil if [
          XML::Node::ELEMENT_NODE,
          XML::Node::ENTITY_NODE,
          XML::Node::ENTITY_REF_NODE,
          XML::Node::DOCUMENT_NODE,
          XML::Node::DOCUMENT_TYPE_NODE,
          XML::Node::DOCUMENT_FRAG_NODE,
          XML::Node::NOTATION_NODE,
          XML::Node::DTD_NODE,
          XML::Node::ENTITY_DECL,
          XML::Node::NAMESPACE_DECL,
        ].include?(type)
        content
      end

      def nodeValue= value
        if read_only?
          raise XML::DOMException.new(XML::DOMException::NO_MODIFICATION_ALLOWED_ERR)
        end

        return if [
          XML::Node::ELEMENT_NODE,
          XML::Node::ENTITY_REF_NODE,
          XML::Node::DTD_NODE,
          XML::Node::DOCUMENT_FRAG_NODE,
          XML::Node::DOCUMENT_NODE,
        ].include?(type)

        if [
          XML::Node::CDATA_SECTION_NODE,
          XML::Node::COMMENT_NODE,
          XML::Node::TEXT_NODE,
          XML::Node::PI_NODE,
          XML::Node::ATTRIBUTE_NODE,
        ].include?(type)
          return self.content = value
        end
        raise(NotImplementedError.new)
      end

      def nodeType
        type
      end

      def parentNode
        parent
      end

      def childNodes
        DOM::NodeList.new do
          self.children
        end
      end

      def firstChild
        children.first
      end

      def lastChild
        children.last
      end

      def previousSibling
        previous_sibling
      end

      def nextSibling
        return nil if self == parent.children.last
        next_sibling
      end

      def attributes
        return nil unless attribute_nodes
        hash = super
        hash.extend(DOM::NamedNodeMap)
        hash.document = document
        hash
      end

      def ownerDocument
        return nil if self == document
        document
      end

      def insertBefore new_child, ref_child
        unless can_append?(new_child)
          raise XML::DOMException.new(XML::DOMException::HIERARCHY_REQUEST_ERR)
        end

        if read_only?
          raise XML::DOMException.new(XML::DOMException::NO_MODIFICATION_ALLOWED_ERR)
        end

        if ref_child && !children.include?(ref_child)
          raise XML::DOMException.new(XML::DOMException::NOT_FOUND_ERR)
        end

        if ancestors.include?(new_child)
          raise XML::DOMException.new(XML::DOMException::HIERARCHY_REQUEST_ERR)
        end

        if new_child.document != document
          raise XML::DOMException.new(XML::DOMException::WRONG_DOCUMENT_ERR)
        end

        unless ref_child
          new_child.parent = self
        else
          return ref_child.add_previous_sibling(new_child)
        end
        new_child
      end

      def replaceChild new_child, old_child
        unless can_append?(new_child)
          raise XML::DOMException.new(XML::DOMException::HIERARCHY_REQUEST_ERR)
        end
        if old_child.read_only?
          raise XML::DOMException.new(XML::DOMException::NO_MODIFICATION_ALLOWED_ERR)
        end
        if self.document != new_child.document
          raise XML::DOMException.new(XML::DOMException::WRONG_DOCUMENT_ERR)
        end
        if ancestors.include?(new_child)
          raise XML::DOMException.new(XML::DOMException::HIERARCHY_REQUEST_ERR)
        end
        unless children.include?(old_child)
          raise XML::DOMException.new(XML::DOMException::NOT_FOUND_ERR)
        end
        old_child.replace new_child
      end

      def removeChild old_child
        if old_child.read_only?
          raise XML::DOMException.new(XML::DOMException::NO_MODIFICATION_ALLOWED_ERR)
        end
        unless children.include?(old_child)
          raise XML::DOMException.new(XML::DOMException::NOT_FOUND_ERR)
        end
        old_child.remove
      end

      def appendChild new_child
        unless can_append?(new_child)
          raise XML::DOMException.new(XML::DOMException::HIERARCHY_REQUEST_ERR)
        end

        if document != new_child.document
          raise XML::DOMException.new(XML::DOMException::WRONG_DOCUMENT_ERR)
        end

        if ancestors.include?(new_child)
          raise XML::DOMException.new(XML::DOMException::HIERARCHY_REQUEST_ERR)
        end
        add_child new_child
        new_child
      end

      def hasChildNodes
        !children.empty?
      end

      def cloneNode deep
        if [
          XML::Node::ENTITY_NODE,
          XML::Node::ENTITY_DECL,
          XML::Node::NOTATION_NODE,
          XML::Node::DOCUMENT_TYPE_NODE,
          XML::Node::DTD_NODE,
          XML::Node::NAMESPACE_DECL,
        ].include?(type)
          raise XML::DOMException.new(XML::DOMException::NOT_SUPPORTED_ERR)
        end
        dup(deep ? 1 : 0)
      end

      def normalize
        raise(NotImplementedError.new)
      end

      def isSupported(feature, version)
        raise(NotImplementedError.new)
      end

      def namespaceURI
        raise(NotImplementedError.new)
      end

      def prefix
        raise(NotImplementedError.new)
      end

      def prefix=(_)
        raise(NotImplementedError.new)
      end

      def localName
        raise(NotImplementedError.new)
      end

      def hasAttributes
        raise(NotImplementedError.new)
      end

      def baseURI
        raise(NotImplementedError.new)
      end

      DOCUMENT_POSITION_DISCONNECTED = 0
      DOCUMENT_POSITION_PRECEDING = 0
      DOCUMENT_POSITION_FOLLOWING = 0
      DOCUMENT_POSITION_CONTAINS = 0
      DOCUMENT_POSITION_CONTAINED_BY = 0
      DOCUMENT_POSITION_IMPLEMENTATION_SPECIFIC = 0
      def compareDocumentPosition(other)
        raise(NotImplementedError.new)
      end

      def textContent
        content
      end

      def textContent= string
        self.content = string
      end

      def isSameNode(other)
        raise(NotImplementedError.new)
      end

      def lookupPrefix(namespaceURI)
        raise(NotImplementedError.new)
      end
      def isDefaultNamespace(namespaceURI)
        raise(NotImplementedError.new)
      end
      def lookupNamespaceURI(prefix)
        raise(NotImplementedError.new)
      end
      def isEqualNode(arg)
        raise(NotImplementedError.new)
      end
      def getFeature(feature, version)
        raise(NotImplementedError.new)
      end
      def setUserData(key, data, handler)
        raise(NotImplementedError.new)
      end
      def getUserData(key)
        raise(NotImplementedError.new)
      end
    end
  end
end
