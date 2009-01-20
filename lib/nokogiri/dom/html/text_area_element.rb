module Nokogiri
  module DOM
    module HTML
      module TextAreaElement
        include FieldSetElement

        attr_accessor :defaultValue

        class << self
          def extended textarea
            textarea.defaultValue ||= textarea.inner_text
          end
        end

        def cols
          (cols = self['cols']) && cols.to_i
        end

        def rows
          (rows = self['rows']) && rows.to_i
        end

        def name
          self['name']
        end
      end
    end
  end
end
