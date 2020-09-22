class CommentsController < ApplicationController
    skip_before_action :authenticate, only: :index
    def create
      
        coffeeShop = CoffeeShop.find_by(external_id: params['coffee_shop_id'])
        comment = Comment.new({content: params['content'],user_name: @current_user.username, coffee_shop_id: coffeeShop.id, user_id: @current_user.id} )

        if comment.valid?
            comment.save
    
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
