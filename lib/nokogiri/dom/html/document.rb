module Nokogiri
  module DOM
    module HTML
      module Document
        def title
          at('.//title').text
        end

        # Returns the URI of the page that linked to this page. The value is
        # an empty string if the user navigated to the page directly (not
        # through a link, but, for example, via a bookmark). 
        def referrer
          ''
        end

        # The domain name of the server that served the document, or a null
        # string if the server cannot be identified by a domain name. 
        def domain
          ''
        end

        def URL
          raise
        end

        def body
          at('.//body')
        end

        def images
          xpath('.//img')
        end

        def applets
          xpath('.//object[applet]', './/applet')
        end
      end
    end
  end
end
