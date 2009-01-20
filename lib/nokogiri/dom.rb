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
        doc
      end
    end
  end
end
