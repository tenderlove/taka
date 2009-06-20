
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
#     The method getPrefix returns the namespace prefix of this node, or null if it is unspecified.
#   
#   Ceate two new element nodes and atribute nodes, with and without namespace prefixes.
#   Retreive the prefix part of their qualified names using getPrefix and verify
#   if it is correct.
# @author IBM
# @author Neil Delima
# see[http://www.w3.org/TR/DOM-Level-2-Core/core#ID-NodeNSPrefix]
##
DOMTestCase('nodegetprefix03') do

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
    preload(contentType, "staff", false)
  end

  ###
  # Runs the test case.
  # @throws Throwable Any uncaught exception causes test to fail
  #
  def test_nodegetprefix03
    doc = nil
    element = nil
    qelement = nil
    attr = nil
    qattr = nil
    elemNoPrefix = nil
    elemPrefix = nil
    attrNoPrefix = nil
    attrPrefix = nil
    doc = load_document("staff", false)
      
      
      
      
      
      
      
      
      assert_nil(elemNoPrefix, "nodegetprefix03_1")
      assert_equal("qual", elemPrefix, "nodegetprefix03_2")
            assert_nil(attrNoPrefix, "nodegetprefix03_3")
      assert_equal("qual", attrPrefix, "nodegetprefix03_4")
            
  end

  ###
  # Gets URI that identifies the test.
  # @return uri identifier of test
  #
  def targetURI
    "http://www.w3.org/2001/DOM-Test-Suite/tests/Level-1/nodegetprefix03"
  end
end
