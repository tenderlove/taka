module Nokogiri
  module DOM
    module HTML
      module OptionElement
        include FieldSetElement

        attr_accessor :defaultSelected

        class << self
          def extended option
            option.defaultSelected = !!option['selected']
          end
        end
      end
    end
  end
end
