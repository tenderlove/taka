module Taka
  module DOM
    module HTML
      module Element
        def id
          super unless key?('id')
          self['id']
        end

        def className
          self['class']
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
