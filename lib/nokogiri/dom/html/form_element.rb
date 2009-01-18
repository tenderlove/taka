module Nokogiri
  module DOM
    module HTML
      module FormElement
        def elements
          xpath('.//select', './/textarea', './/input')
        end

        def length
          elements.length
        end

        def acceptCharset
          self['accept-charset']
        end

        def method
          self['method']
        end
      end
    end
  end
end
