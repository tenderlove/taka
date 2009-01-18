require 'nokogiri/dom/html/collection'
require 'nokogiri/dom/html/document'
require 'nokogiri/dom/html/element'
require 'nokogiri/dom/html/table_element'
require 'nokogiri/dom/html/table_row_element'
require 'nokogiri/dom/html/anchor_element'
require 'nokogiri/dom/html/applet_element'
require 'nokogiri/dom/html/area_element'
require 'nokogiri/dom/html/body_element'
require 'nokogiri/dom/html/form_element'
require 'nokogiri/dom/html/button_element'
require 'nokogiri/dom/html/select_element'

module Nokogiri
  module DOM
    class << self
      def HTML *args
        doc = Nokogiri::HTML(*args)
        doc.decorators(XML::Node) << DOM::HTML::Element
        doc.decorators(XML::NodeSet) << DOM::HTML::Collection
        doc.extend(DOM::HTML::Document)
        doc.extend(Module.new {
          def decorate node
            return super unless node.respond_to?(:name)
            node.extend(DOM::HTML::Element)
            ({
              'table'   => [DOM::HTML::TableElement],
              'tr'      => [DOM::HTML::TableRowElement],
              'thead'   => [DOM::HTML::TableRowElement],
              'tfoot'   => [DOM::HTML::TableRowElement],
              'a'       => [DOM::HTML::AnchorElement],
              'applet'  => [DOM::HTML::AppletElement],
              'area'    => [DOM::HTML::AreaElement],
              'body'    => [DOM::HTML::BodyElement],
              'form'    => [DOM::HTML::FormElement],
              'button'  => [DOM::HTML::ButtonElement],
              'select'  => [DOM::HTML::SelectElement],
            }[node.name] || []).each do |klass|
              node.extend(klass)
            end

            super
            node
          end
        })
        doc
      end
    end
  end
end
