class CoffeeShopsController < ApplicationController

    def loadShops
       
        shops = CoffeeShop.getShops(cordinates_params)

        render json: shops

    end

    private

    def cordinates_params
        params.permit(:latitude, :longitude)
    end

end
