module Nokogiri
  module DOM
    module HTML
      module FieldSetElement
        def form
          my_parent = parent
          while my_parent && my_parent.node_name != 'form'
            my_parent = my_parent.parent
          end
          my_parent
        end
      end
    end
  end
end
