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
    end
  end
end
