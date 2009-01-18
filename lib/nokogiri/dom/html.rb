require 'nokogiri/dom/html/element'
require 'nokogiri/dom/html/table_element'
require 'nokogiri/dom/html/table_row_element'

module Nokogiri
  module DOM
    class << self
      def HTML *args
        doc = Nokogiri::HTML(*args)
        doc.decorators(XML::Node) << DOM::HTML::Element
        doc.extend(Module.new {
          def decorate node
            return super unless node.respond_to?(:name)
            extender = {
              'table' => DOM::HTML::TableElement,
              'tr'    => DOM::HTML::TableRowElement,
              'thead' => DOM::HTML::TableRowElement,
              'tfoot' => DOM::HTML::TableRowElement,
            }[node.name]
            node.extend(extender) if extender

            super
            node
          end
        })
        doc
      end
    end
  end
end
