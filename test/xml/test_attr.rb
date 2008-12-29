require File.expand_path(File.join(File.dirname(__FILE__), '..', "helper"))

module Nokogiri
  module XML
    class TestAttr < Nokogiri::TestCase
      def test_create
        xml = Nokogiri::XML(<<-eoxml)
        <root>
          <a>Hello world</a>
        </root>
        eoxml
        attr = Nokogiri::XML::Attr.new('hello', xml)
        assert_equal 'hello', attr.name
      end
    end
  end
end
