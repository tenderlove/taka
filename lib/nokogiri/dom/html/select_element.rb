module Nokogiri
  module DOM
    module HTML
      module SelectElement
        def name
          self['name']
        end
      end
    end
  end
end
