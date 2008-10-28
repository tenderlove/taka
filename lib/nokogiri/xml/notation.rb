module Nokogiri
  module XML
    class Notation < Struct.new(:name, :public_id, :system_id)
      include DOM::Notation
    end
  end
end
