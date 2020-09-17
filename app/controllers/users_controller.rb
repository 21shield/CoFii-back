class UsersController < ApplicationController
    def create
        user = User.create(user_params)
        if user.valid?
            render json:{user: UserSerializer.new(users), status: :created}

        else
            render json: {error: 'failed to create user'}, status: :not_acceptable
            
        end
    end

    # private methods
    
    private

    def user_params
        params.require(:user).permit(:username, :password,:password_confirmation, :email, :bio, :avatar)
    end


end
