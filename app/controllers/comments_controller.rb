class CommentsController < ApplicationController

    def create
        coffeeShop = CoffeeShop.find_by(external_id: params['coffee_shop_id'])
        comment = Comment.new({content: params['content'],coffee_shop_id: coffeeShop.id, user_id: @current_user.id} )

        if comment.valid?
            comment.save
            render json: {comment: CommentSerializer.new(comment)}
        else
            render json: {error: comment.errors.full_messages}
        end
       
    end

    

end
