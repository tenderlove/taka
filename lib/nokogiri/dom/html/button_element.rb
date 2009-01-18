module Nokogiri
  module DOM
    module HTML
      module ButtonElement
        def form
          my_parent = parent
          while my_parent && my_parent.node_name != 'form'
            my_parent = my_parent.parent
          end
          my_parent
        end

        def name
          self['name']
        end

        def tabIndex
          (self['tabindex'] || 0).to_i
        end

        def type
          self['type']
        end
      end
    end
  end
end
