module Nokogiri
  module DOM
    module HTML
      module TableCellElement
        def cellIndex
          tr = parent
          while tr.node_name != 'tr'
            tr = tr.parent
          end
          tr.cells.each_with_index do |cell,i|
            return i if cell == self
          end
        end

        def ch
          self['char']
        end
      end
    end
  end
end
