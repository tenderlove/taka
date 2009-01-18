module Nokogiri
  module DOM
    module HTML
      module TableRowElement
        def rowIndex
          parent_table = self.parent
          while parent_table.name != 'table'
            parent_table = parent_table.parent
          end

          parent_table.rows.each_with_index do |row, i|
            return i if row == self
          end
          raise
        end
      end
    end
  end
end
