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
require 'nokogiri/dom/html/field_set_element'
require 'nokogiri/dom/html/button_element'
require 'nokogiri/dom/html/select_element'
require 'nokogiri/dom/html/frame_element'
require 'nokogiri/dom/html/iframe_element'
require 'nokogiri/dom/html/image_element'
require 'nokogiri/dom/html/input_element'
require 'nokogiri/dom/html/is_index_element'
require 'nokogiri/dom/html/label_element'
require 'nokogiri/dom/html/legend_element'
require 'nokogiri/dom/html/li_element'
require 'nokogiri/dom/html/link_element'
require 'nokogiri/dom/html/map_element'
require 'nokogiri/dom/html/meta_element'
require 'nokogiri/dom/html/object_element'
require 'nokogiri/dom/html/olist_element'
require 'nokogiri/dom/html/option_element'

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
              'table'     => [DOM::HTML::TableElement],
              'tr'        => [DOM::HTML::TableRowElement],
              'thead'     => [DOM::HTML::TableRowElement],
              'tfoot'     => [DOM::HTML::TableRowElement],
              'a'         => [DOM::HTML::AnchorElement],
              'applet'    => [DOM::HTML::AppletElement],
              'area'      => [DOM::HTML::AreaElement],
              'body'      => [DOM::HTML::BodyElement],
              'form'      => [DOM::HTML::FormElement],
              'button'    => [DOM::HTML::ButtonElement],
              'select'    => [DOM::HTML::SelectElement],
              'fieldset'  => [DOM::HTML::FieldSetElement],
              'frame'     => [DOM::HTML::FrameElement],
              'iframe'    => [DOM::HTML::IFrameElement],
              'img'       => [DOM::HTML::ImageElement],
              'input'     => [DOM::HTML::InputElement],
              'isindex'   => [DOM::HTML::IsIndexElement],
              'label'     => [DOM::HTML::LabelElement],
              'legend'    => [DOM::HTML::LegendElement],
              'li'        => [DOM::HTML::LiElement],
              'link'      => [DOM::HTML::LinkElement],
              'map'       => [DOM::HTML::MapElement],
              'meta'      => [DOM::HTML::MetaElement],
              'object'    => [DOM::HTML::ObjectElement],
              'ol'        => [DOM::HTML::OListElement],
              'option'    => [DOM::HTML::OptionElement],
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
