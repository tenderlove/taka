module Nokogiri
  module XML
    class Text < Node
      include DOM::Text
      include DOM::CharacterData
    end
  end
end
