module Nokogiri
  module DOM
    module HTML
      module SelectElement
        def name
          self['name']
        end

        def options
          xpath('.//option')
        end
      end
    end
  end
end
