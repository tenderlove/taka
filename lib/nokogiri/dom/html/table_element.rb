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
          siblings = xpath('.//tr')
          tr = XML::Node.new('tr', self.document)

          if !siblings[index]
            self.add_child tr
          else
            siblings[index].add_previous_sibling tr
          end
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
          xpath('./tbody')
        end

        def createTHead
          head = tHead
          return head if head
          head = Nokogiri::XML::Node.new('thead', document)
          add_child head
        end

        def deleteTHead
          head = tHead
          head.unlink if head
          nil
        end

        def createTFoot
          return self.tFoot if tFoot
          foot = Nokogiri::XML::Node.new('tfoot', document)
          add_child foot
          foot
        end

        def deleteTFoot
          tFoot.unlink if tFoot
          nil
        end

        def createCaption
          return self.caption if caption
          my_caption = Nokogiri::XML::Node.new('caption', document)
          add_child my_caption
          my_caption
        end

        def deleteCaption
          caption.unlink if caption
          nil
        end
      end
    end
  end
end
