{% include guidelines/rails/api_only_project_tree.md %}


**app/controllers/api/api_controller.rb**
```ruby
module Api
  class ApiController < ActionController::API
  end
end
```

**app/controllers/api/v1/base_controller.rb**
```ruby
module Api
  module V1
    # Base API controller. It is used by other controllers in API/V1 directory.
    class BaseController < Api::ApiController
      # before_action :set_current_user
      # before_action :check_blocked_user

      # def send_response(status, message, code, data)
      #   response = {
      #     status: status,
      #     message: message
      #   }
      #   response['data'] = data if data
      #   response['code'] = code if code
      #   render json: response, status: status
      # end
      #
      # rescue_from Apipie::Error do |e|
      #   send_response(
      #     422,
      #     e.message,
      #     "ERR_#{controller_name}##{action_name}_INVALID_PARAM_#{e.param}".upcase,
      #     nil
      #   )
      # end

      # def set_current_user
      #   @current_user_cognito = AwsCognitoService.new.get_current_user(request.headers['Authorization'])
      #   @current_user = UserIdentity
      #                   .includes(user_account: [:organization])
      #                   .find_by(identity_id: @current_user_cognito.username)
      #                   .user_account
      # rescue StandardError => e
      #   send_response(401, 'User unauthorized', 'ERR_USER_UNAUTHORIZED', { error: e })
      # end
      #
      # def check_blocked_user
      #   send_response(403, 'User unauthorized', 'ERR_USER_BLOCKED', nil) if @current_user.blocked?
      # end
    end
  end
end
```
