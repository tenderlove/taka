module Nokogiri
  module DOM
    module HTML
      module SelectElement
        include FieldSetElement

        def name
          self['name']
        end

        def options
          xpath('.//option')
        end

        def type
          return 'select-multiple' if self['multiple']
          self['type']
        end

        def selectedIndex
          options.each_with_index do |option, i|
            return i if option.selected
          end
          -1
        end

        def value
          options.each do |option|
            return option.value if option.selected
          end
          options.first.value
        end

        def length
          options.length
        end
      end
    end
  end
end
