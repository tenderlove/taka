require 'test/unit'
$LOAD_PATH << File.join(File.expand_path('~aaron'), 'git', 'nokogiri', 'lib')
$LOAD_PATH << File.join(File.expand_path('~aaron'), 'git', 'nokogiri', 'ext')
require 'nokogiri'

module DOM
  class TestCase < Test::Unit::TestCase
    BASE = File.expand_path(File.dirname(__FILE__))
    undef :default_test

    # Default this to text/xml for now....
    def content_type
      "text/xml"
    end
    alias :getContentType :content_type

    def equals(one, two)
      one == two
    end

    def assertTrue(msg, test)
      assert test, msg
    end

    def assertFalse(msg, test)
      assert !test, msg
    end

    def assertSame(msg, expected, actual)
      assert_equal expected, actual, msg
    end

    def assertSize(msg, expected, actual)
      assert_equal(actual.length, expected, msg)
    end

    def assertEqualsIgnoreCase(msg, expected, actual)
      assert_equal(expected.downcase, actual.downcase, msg)
    end

    def preload(content_type, doc_uri, will_be_modified)
      if ['text/html', 'application/xhtml+xml'].include?(content_type)
        if doc_uri =~ /^staff/ || doc_uri == 'datatype_normalization'
          raise "Not a compatible test.... #{content_type}, #{doc_uri}"
        end
      end
    end

    def load_document(doc_uri, will_be_modified)
      options = self.class.name =~ /attrdefaultvalue/i ? 15 : 3
      options |= (1 << 5 | 1 << 6)
      file = File.join(BASE, 'dom', 'level1','core','files',"#{doc_uri}.xml")
      Nokogiri.parse(File.read(file), file, nil, options)
    end
  end
end

def DOMTestCase(test_case_name, &block)
  klass = test_case_name.capitalize
  raise "Already defined!" if Object.const_defined?(klass.to_sym)
  test_klass = Class.new(DOM::TestCase, &block)
  Object.const_set(klass.to_sym, test_klass)
end
