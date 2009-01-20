require 'nokogiri/dom/element'
require 'nokogiri/dom/node'
require 'nokogiri/dom/processing_instruction'
require 'nokogiri/dom/document'
require 'nokogiri/dom/node_set'
require 'nokogiri/dom/text'
require 'nokogiri/dom/attr'
require 'nokogiri/dom/named_node_map'
require 'nokogiri/dom/notation'
require 'nokogiri/dom/character_data'
require 'nokogiri/dom/node_list'
require 'nokogiri/dom/html'

module Nokogiri
  module DOM
    class << self
      def XML *args
        doc = Nokogiri::XML(*args)
        doc.extend(DOM::Element)
        doc.extend(DOM::Node)
        doc.extend(DOM::Document)
        doc.extend(Module.new {
          def decorate node
            nx = Nokogiri::XML
            list = {
              nx::Node     => [DOM::Element, DOM::Node],
              nx::Element  => [DOM::Element, DOM::Node],
              nx::Attr     => [DOM::Element, DOM::Node, DOM::Attr],
              nx::NodeSet  => [DOM::NodeSet],
              nx::Text     => [DOM::Element, DOM::Node, DOM::Text, DOM::CharacterData],
              nx::CDATA    => [DOM::Element, DOM::Node, DOM::Text, DOM::CharacterData],
              nx::ProcessingInstruction => [DOM::Element, DOM::Node, DOM::ProcessingInstruction],
              nx::EntityDeclaration => [DOM::Element, DOM::Node],
              nx::DTD     => [DOM::Element, DOM::Node],
              nx::DocumentFragment => [DOM::Element, DOM::Node],
              nx::Comment => [DOM::Element, DOM::Node],
            }[node.class]

            raise("Unknown type #{node.class.name}") unless list

            list.each { |mod| node.extend(mod) }
          end
        })
        doc
      end
    end
  end
end
