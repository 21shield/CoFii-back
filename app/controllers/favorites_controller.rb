class FavoritesController < ApplicationController

    def create
        shop = CoffeeShop.find_by(external_id: params[:id])

        fav = Favorite.find_or_create_by(user_id: @current_user.id, coffee_shop_id: shop.id)

        render json: {fav: FavoriteSerializer.new(fav)}
    end

    # def getFaves
    #     debugger
        
    # end

    def delete
        shop = CoffeeShop.find_by(external_id: params[:id])
        fav = Favorite.find_by(coffee_shop_id: shop[:id], user_id: @current_user.id)

         fav.destroy()
         
         render json: fav
    end
end
