module OauthConsumerEngine
  module Controller
    extend ActiveSupport::Concern

    included do |base|
      # do stuff when included
    end

    module InstanceMethods
      
      def login_required
        if !current_user
          respond_to do |format|
            format.html  {
              redirect_to login_path
            }
            format.json {
              render :json => { 'error' => 'Access Denied' }.to_json
            }
          end
        end
      end

      def current_user
        return nil unless session[:user_id]
        @current_user ||= User.find_by_uid(session[:user_id]['uid'])
      end

    end
  end
end

