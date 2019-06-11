class ApplicationController < ActionController::API

    def current_user
        auth_token = request.headers['AuthToken']
        if auth_token
            payload=JWT.decode(auth_token, ENV['TOKEN_SECRET']).first
            User.find_by(id: payload['user_id'])
        else
            return nil
        end
    end
    
    def authorize!
        unless current_user
            render json: {errors: ['You are not logged in']}, status: :unauthorized
        end
    end
end
