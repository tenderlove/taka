module Nokogiri
  module DOM
    module HTML
      module TableElement
        def rows
          DOM::NodeList.new {
            xpath('./thead', './tfoot', './tr', './tbody/tr')
          }
        end

        def insertRow index
          tr = XML::Node.new('tr', self.document)
          self.add_child tr
          tr
        end
      end
    end
  end
end
