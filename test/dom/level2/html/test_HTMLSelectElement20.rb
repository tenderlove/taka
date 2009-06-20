
###
# This Ruby source file was generated by test-to-ruby.xsl
# and is a derived work from the source document.
# The source document contained the following notice:
=begin


Copyright (c) 2004 World Wide Web Consortium, 
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
# Attempting to add an new option using HTMLSelectElement.add before a node that is not a child of the select
# element should raise a NOT_FOUND_ERR.
# @author Curt Arnold
# see[http://www.w3.org/TR/DOM-Level-2-HTML/html#ID-14493106]
##
DOMTestCase('HTMLSelectElement20') do

  ###
  # Constructor.
  # @param factory document factory, may not be null
  # @throws org.w3c.domts.DOMTestIncompatibleException Thrown if test is not compatible with parser configuration
  ##
  def setup
    ##
    ##   check if loaded documents are supported for content type
    ##
    contentType = getContentType()
    preload(contentType, "select", true)
  end

  ###
  # Runs the test case.
  # @throws Throwable Any uncaught exception causes test to fail
  #
  def test_HTMLSelectElement20
    nodeList = nil
    testNode = nil
    doc = nil
    optLength = nil
    selected = nil
    newOpt = nil
    newOptText = nil
    retNode = nil
    options = nil
    otherSelect = nil
    selectedNode = nil
    doc = load_document("select", true)
      nodeList = doc.getElementsByTagName("select")
      assertSize("Asize", 3, nodeList)
      testNode = nodeList.item(0)
      otherSelect = nodeList.item(1)
      newOpt = doc.createElement("option")
      newOptText = doc.createTextNode("EMP31415")
      retNode = newOpt.appendChild(newOptText)
      options = otherSelect.options()
      selectedNode = options.item(0)
      
    begin
      success = false;
      begin
        testNode.add(newOpt, selectedNode)
      rescue Nokogiri::XML::DOMException => ex
        success = (ex.code == Nokogiri::XML::DOMException::NOT_FOUND_ERR)
      end 
      assert(success, "throw_NOT_FOUND_ERR")
    end

  end

  ###
  # Gets URI that identifies the test.
  # @return uri identifier of test
  #
  def targetURI
    "http://www.w3.org/2001/DOM-Test-Suite/tests/Level-1/HTMLSelectElement20"
  end
end
