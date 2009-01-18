module Nokogiri
  module DOM
    module HTML
      module BodyElement
        def text
          self['text']
        end
      end
    end
  end
end
