
###
# This Ruby source file was generated by test-to-ruby.xsl
# and is a derived work from the source document.
# The source document contained the following notice:
=begin


Copyright (c) 2001 World Wide Web Consortium, 
(Massachusetts Institute of Technology, Institut National de
Recherche en Informatique et en Automatique, Keio University).  All 
Rights Reserved.  This program is distributed under the W3C's Software
Intellectual Property License.  This program is distributed in the 
hope that it will be useful, but WITHOUT ANY WARRANTY; without even
the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR 
PURPOSE.  

See W3C License http://www.w3.org/Consortium/Legal/ for more details.


=end
#

require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', '..', 'helper'))

###
#       Testing Element.setAttributeNodeNS: If an attribute with that local name 
#       and that namespace URI is already present in the element, it is replaced
#       by the new one.
#       Create a new element and two new attribute nodes (in the same namespace
#       and same localNames).  
#       Add the two new attribute nodes to the element node using the 
#       setAttributeNodeNS method.  Check that only one attribute is added, check
#       the value of this attribute.
 #     
# @author IBM
# @author Neil Delima
# see[http://www.w3.org/TR/DOM-Level-2-Core/core#ID-ElSetAtNodeNS]
##
DOMTestCase('elementsetattributenodens01') do

  ###
  # Constructor.
  # @param factory document factory, may not be null
  # @throws org.w3c.domts.DOMTestIncompatibleException Thrown if test is not compatible with parser configuration
  ##
  def setup
=begin
      org.w3c.domts.DocumentBuilderSetting[] settings = 
          new org.w3c.domts.DocumentBuilderSetting[] {
org.w3c.domts.DocumentBuilderSetting.namespaceAware
        };
        DOMTestDocumentBuilderFactory testFactory = factory.newInstance(settings)
        setFactory(testFactory)
=end

    ##
    ##   check if loaded documents are supported for content type
    ##
    contentType = getContentType()
    preload(contentType, "staff", true)
  end

  ###
  # Runs the test case.
  # @throws Throwable Any uncaught exception causes test to fail
  #
  def test_elementsetattributenodens01
    doc = nil
    element = nil
    attribute1 = nil
    attribute2 = nil
    attrNode = nil
    attrName = nil
    attrNS = nil
    attrValue = nil
    attributes = nil
    newAttribute = nil
    length = nil
    doc = load_document("staff", true)
      
      
      
      attribute2.value = "value2"
      
      
      
      attrName = attrNode.nodeName()
      
      assert_equal("p2:att", attrName, "elementsetattributenodens01_attrName")
            assert_equal("http://www.w3.org/DOM/Test/att1", attrNS, "elementsetattributenodens01_attrNS")
            attributes = element.attributes()
      length = attributes.length()
      assert_equal(1, length, "length")
            
  end

  ###
  # Gets URI that identifies the test.
  # @return uri identifier of test
  #
  def targetURI
    "http://www.w3.org/2001/DOM-Test-Suite/tests/Level-1/elementsetattributenodens01"
  end
end
