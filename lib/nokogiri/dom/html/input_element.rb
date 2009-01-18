module Nokogiri
  module DOM
    module HTML
      module InputElement
        attr_accessor :defaultValue

        class << self
          def extended input
            input.defaultValue ||= input['value']
          end
        end
      end
    end
  end
end
