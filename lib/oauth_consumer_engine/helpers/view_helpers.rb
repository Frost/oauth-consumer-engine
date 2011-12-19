module OauthConsumerEngine
  module Helpers
    module ViewHelpers
      def login_link
        link_to "Sign in", login_path
      end

      def logout_link
        link_to "Sign out", logout_path
      end
    end
  end
end

