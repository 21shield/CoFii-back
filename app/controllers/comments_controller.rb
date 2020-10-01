class CommentsController < ApplicationController
    skip_before_action :authenticate, only: :index
    def create
        coffeeShop = CoffeeShop.find_by(external_id: params['coffee_shop_id'])
        comment = @current_user.comments.create(content: params['content'], user_name: @current_user.username)
        coffeeShop.comments << comment
        if comment.valid?
            render json: {comment: CommentSerializer.new(comment)}
        else
            render json: {error: comment.errors.full_messages}
        end
       
    end

    def index
        comments = Comment.all
        render json: comments
    end

    

end
