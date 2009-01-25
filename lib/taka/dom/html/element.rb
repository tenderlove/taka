module Taka
  module DOM
    module HTML
      module Element
        def id
          getAttribute('id')
        end

        def className
          self['class']
        end

        ###
        # NOT part of W3C DOM spec.
        # http://developer.mozilla.org/en/DOM/element.innerHTML
        def innerHTML
          inner_html
        end

        def method_missing method, *args, &block
          attribute = method.to_s.downcase
          super unless key?(attribute)
          self[attribute]
        end
      end
    end
  end
end
