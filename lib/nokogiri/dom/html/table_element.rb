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

        def caption
          at('./caption')
        end

        def tHead
          at('./thead')
        end

        def tFoot
          at('./tfoot')
        end

        def tBodies
          at('./tbody')
        end
      end
    end
  end
end
