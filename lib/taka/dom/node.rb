module Taka
  module DOM
    module Node
      ELEMENT_NODE =       1
      ATTRIBUTE_NODE =     2
      TEXT_NODE =          3
      CDATA_SECTION_NODE = 4
      ENTITY_REF_NODE =    5
      ENTITY_NODE =        6
      PI_NODE =            7
      COMMENT_NODE =       8
      DOCUMENT_NODE =      9
      DOCUMENT_TYPE_NODE = 10
      DOCUMENT_FRAG_NODE = 11
      NOTATION_NODE =      12
      HTML_DOCUMENT_NODE = 13
      DTD_NODE =           14
      ELEMENT_DECL =       15
      ATTRIBUTE_DECL =     16
      ENTITY_DECL =        17
      NAMESPACE_DECL =     18
      XINCLUDE_START =     19
      XINCLUDE_END =       20
      DOCB_DOCUMENT_NODE = 21

      def nodeName
        return '#text' if text?
        return '#comment' if comment?
        return '#document' if self == document
        node_name
      end

      def nodeValue
        return nil if [
          ELEMENT_NODE,
          ENTITY_NODE,
          ENTITY_REF_NODE,
          DOCUMENT_NODE,
          DOCUMENT_TYPE_NODE,
          DOCUMENT_FRAG_NODE,
          NOTATION_NODE,
          DTD_NODE,
          ENTITY_DECL,
          NAMESPACE_DECL,
        ].include?(nodeType)
        content
      end

      def nodeValue= value
        if read_only?
          raise DOMException.new(DOMException::NO_MODIFICATION_ALLOWED_ERR)
        end

        return if [
          ELEMENT_NODE,
          ENTITY_REF_NODE,
          DTD_NODE,
          DOCUMENT_FRAG_NODE,
          DOCUMENT_NODE,
        ].include?(nodeType)

        if [
          CDATA_SECTION_NODE,
          COMMENT_NODE,
          TEXT_NODE,
          PI_NODE,
          ATTRIBUTE_NODE,
        ].include?(nodeType)
          return self.content = value
        end
        raise(NotImplementedError.new)
      end

      def nodeType
        node_type
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
          raise DOMException.new(DOMException::HIERARCHY_REQUEST_ERR)
        end

        if read_only?
          raise DOMException.new(DOMException::NO_MODIFICATION_ALLOWED_ERR)
        end

        if ref_child && !children.include?(ref_child)
          raise DOMException.new(DOMException::NOT_FOUND_ERR)
        end

        if ancestors.include?(new_child)
          raise DOMException.new(DOMException::HIERARCHY_REQUEST_ERR)
        end

        if new_child.document != document
          raise DOMException.new(DOMException::WRONG_DOCUMENT_ERR)
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
          raise DOMException.new(DOMException::HIERARCHY_REQUEST_ERR)
        end
        if old_child.read_only?
          raise DOMException.new(DOMException::NO_MODIFICATION_ALLOWED_ERR)
        end
        if self.document != new_child.document
          raise DOMException.new(DOMException::WRONG_DOCUMENT_ERR)
        end
        if ancestors.include?(new_child)
          raise DOMException.new(DOMException::HIERARCHY_REQUEST_ERR)
        end
        unless children.include?(old_child)
          raise DOMException.new(DOMException::NOT_FOUND_ERR)
        end
        old_child.replace new_child
      end

      def removeChild old_child
        if old_child.read_only?
          raise DOMException.new(DOMException::NO_MODIFICATION_ALLOWED_ERR)
        end
        unless children.include?(old_child)
          raise DOMException.new(DOMException::NOT_FOUND_ERR)
        end
        old_child.remove
      end

      def appendChild new_child
        unless can_append?(new_child)
          raise DOMException.new(DOMException::HIERARCHY_REQUEST_ERR)
        end

        if document != new_child.document
          raise DOMException.new(DOMException::WRONG_DOCUMENT_ERR)
        end

        if ancestors.include?(new_child)
          raise DOMException.new(DOMException::HIERARCHY_REQUEST_ERR)
        end
        add_child new_child
        new_child
      end

      def hasChildNodes
        !children.empty?
      end

      def cloneNode deep
        if [
          Node::ENTITY_NODE,
          Node::ENTITY_DECL,
          Node::NOTATION_NODE,
          Node::DOCUMENT_TYPE_NODE,
          Node::DTD_NODE,
          Node::NAMESPACE_DECL,
        ].include?(nodeType)
          raise DOMException.new(DOMException::NOT_SUPPORTED_ERR)
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

      ###
      # Returns true if +new_child+ can be appended
      def can_append? new_child
        return true if new_child.nodeType == DOCUMENT_FRAG_NODE
        return false if [
          DOCUMENT_TYPE_NODE,
          DTD_NODE,
          PI_NODE,
          COMMENT_NODE,
          TEXT_NODE,
          CDATA_SECTION_NODE,
          NOTATION_NODE
        ].include?(nodeType)

        if [
          DOCUMENT_FRAG_NODE,
          ENTITY_REF_NODE,
          ELEMENT_NODE,
          ENTITY_NODE,
          ENTITY_DECL
        ].include?(nodeType)
          return false unless [
            ELEMENT_NODE,
            PI_NODE,
            COMMENT_NODE,
            TEXT_NODE,
            CDATA_SECTION_NODE,
            ENTITY_REF_NODE
          ].include?(new_child.nodeType)
        end

        case nodeType
        when DOCUMENT_NODE
          return false unless [
            ELEMENT_NODE,
            PI_NODE,
            COMMENT_NODE,
            DTD_NODE,
            DOCUMENT_TYPE_NODE,
            ELEMENT_NODE,
          ].include?(new_child.nodeType)
        when ATTRIBUTE_NODE
          return false unless [
            TEXT_NODE,
            ENTITY_REF_NODE,
          ].include?(new_child.nodeType)
        end

        true
      end

      def js_property? name
        return true if [:firstChild].include?(name)
        false
      end

    end
  end
end
