class ApplicationController < ActionController::API

    def current_user
        auth_token = request.headers['AUTH_TOKEN']
        if auth_token
            payload=JWT.decode(auth_token, ENV['TOKEN_SECRET'])
            User.find_by(id: payload[:user_id])
        else
            return nil
        end
    end
    
    def authorize!
        unless current_user
            render json: {errors: 'You are not logged in'}, status: :unauthorized
        end
    end
end
