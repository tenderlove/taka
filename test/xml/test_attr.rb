require File.expand_path(File.join(File.dirname(__FILE__), '..', "helper"))

module Nokogiri
  module XML
    class TestAttr < Nokogiri::TestCase
      def test_new
        xml = Nokogiri::XML(<<-eoxml)
        <root>
          <a>Hello world</a>
        </root>
        eoxml
        attr_node = Nokogiri::XML::Attr.new(xml, 'hello')
        assert_equal 'hello', attr_node.name
        assert_equal Nokogiri::XML::Node::ATTRIBUTE_NODE, attr_node.type
      end

      def test_unlink
        xml = Nokogiri::XML.parse(File.read(XML_FILE), XML_FILE)
        address = xml.xpath('/staff/employee/address').first
        assert_equal 'Yes', address['domestic']
        address.attribute_nodes.first.unlink
        assert_nil address['domestic']
      end
    end
  end
end
