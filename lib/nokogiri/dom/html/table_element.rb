module Nokogiri
  module DOM
    module HTML
      module TableElement
        def rows
          xpath('./thead', './tfoot', './tr', './tbody/tr')
        end
      end
    end
  end
end
