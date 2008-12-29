require File.expand_path(File.join(File.dirname(__FILE__), '..', "helper"))

module Nokogiri
  module XML
    class TestEntityReference < Nokogiri::TestCase
      def test_new
        xml = Nokogiri::XML(<<-eoxml)
        <root>
          <a>Hello world</a>
        </root>
        eoxml
        node = Nokogiri::XML::EntityReference.new(xml, 'hello')
        assert_equal 'hello', node.name
        assert_equal Nokogiri::XML::Node::ENTITY_REF_NODE, node.type
      end
    end
  end
end
