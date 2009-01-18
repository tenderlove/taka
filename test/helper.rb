$VERBOSE = true
require 'test/unit'

%w(../lib ../ext).each do |path|
  $LOAD_PATH.unshift(File.expand_path(File.join(File.dirname(__FILE__), path)))
end

require 'nokogiri'

module Nokogiri
  class TestCase < Test::Unit::TestCase
    ASSETS_DIR = File.join(File.dirname(__FILE__), 'files')
    XML_FILE = File.join(ASSETS_DIR, 'staff.xml')
    XSLT_FILE = File.join(ASSETS_DIR, 'staff.xslt')
    EXSLT_FILE = File.join(ASSETS_DIR, 'exslt.xslt')
    EXML_FILE = File.join(ASSETS_DIR, 'exslt.xml')
    HTML_FILE = File.join(ASSETS_DIR, 'tlm.html')

    unless RUBY_VERSION >= '1.9'
      undef :default_test
    end

    def teardown
      if ENV['NOKOGIRI_GC']
        STDOUT.putc '!'
        GC.start 
      end
    end
  end

  module SAX
    class TestCase < Nokogiri::TestCase
      class Doc < XML::SAX::Document
        attr_reader :start_elements, :start_document_called
        attr_reader :end_elements, :end_document_called
        attr_reader :data, :comments, :cdata_blocks

        def start_document
          @start_document_called = true
          super
        end

        def end_document
          @end_document_called = true
          super
        end

        def start_element *args
          (@start_elements ||= []) << args
          super
        end

        def end_element *args
          (@end_elements ||= []) << args
          super
        end

        def characters string
          @data ||= []
          @data += [string]
          super
        end

        def comment string
          @comments ||= []
          @comments += [string]
          super
        end

        def cdata_block string
          @cdata_blocks ||= []
          @cdata_blocks += [string]
          super
        end
      end
    end
  end
end

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

    ### WTF.  FIXME
    def assertURIEquals *args
      args = args.compact
      assert_match args[1], args[2]
    end

    ### FIXME not sure how this assertion is supposed to work
    def assertEqualsAutoCase one, two, expected, actual
      assert_equal expected.downcase, actual.downcase
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
      if self.class.name =~ /^Html/
        html_file = File.join(BASE, 'dom', 'level1','html','files',"#{doc_uri}.html")
        Nokogiri::DOM::HTML(File.open(html_file), html_file, nil, options)
      else
        xml_file = File.join(BASE, 'dom', 'level1','core','files',"#{doc_uri}.xml")
        Nokogiri::XML(File.open(xml_file), xml_file, nil, options)
      end
    end
  end
end

def DOMTestCase(test_case_name, &block)
  klass = test_case_name.capitalize
  raise "Already defined!" if Object.const_defined?(klass.to_sym)
  test_klass = Class.new(DOM::TestCase, &block)
  Object.const_set(klass.to_sym, test_klass)
end
