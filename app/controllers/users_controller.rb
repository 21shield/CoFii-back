class UsersController < ApplicationController
    def create
        user = User.create(user_params)
        if user.valid?
            render json:{ user: UserSerializer.new(user)}, status: :created

        else
            render json: { error: 'failed to create user'}, status: :not_acceptable
            
        end
    end

    def login
        user = User.find_by(username: user_params[:username])
        if user && user.authenticate(params[:password])
            render json: user
        else
            render json: { message: 'INVALID USERNAME OR PASSWORD'}, status: :unauthorized
        end
    end

    def autologin
        user = User.find_by()
        if user
            render json: {user: UserSerializer.new(user)}, status: :authorized
        else
            render json: {error: "INVALID LOGIN"}, status: :unauthorized
        end

    end

    # private methods
    
    private

    def user_params
        params.permit(:username, :password,:password_confirmation, :email, :bio, :avatar)
    end


end
