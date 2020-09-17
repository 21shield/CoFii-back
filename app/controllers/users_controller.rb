class UsersController < ApplicationController
    before_action :authenticate, only: [:autologin]

    def create
        user = User.create(user_params)
        if user.valid?
            token = encode_token({ user_id: user.id})

            render json:{ user: UserSerializer.new(user), token: token}, status: :created

        else
            render json: { error: user.errors.full_messages}, status: :not_acceptable
            
        end
    end

    def login
        user = User.find_by(username: user_params[:username])

        if user && user.authenticate(params[:password])

            token = encode_token({ user_id: user.id})
            render json: {user: UserSerializer.new(user), token: token} 
        else

            render json: { message: 'INVALID USERNAME OR PASSWORD'}, status: :unauthorized
        end
    end
    

    def autologin
        render json: {user: UserSerializer.new(@current_user)}
    end

    # private methods
    
    private

    def user_params
        params.permit(:username, :password,:password_confirmation, :email, :bio, :avatar)
    end


end
