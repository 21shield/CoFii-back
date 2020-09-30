class CoffeeShopsController < ApplicationController
    skip_before_action :authenticate, only: :index

    def index
        coffeeShops = CoffeeShop.all
        render json: coffeeShops
    end

    def loadShops
       
        response = CoffeeShop.getShops(cordinates_params)
        # create/findor create by shops is a array of objs
        data = JSON.parse(response.body)
        created_shops = data['businesses'].map do |shop|
            params = {
                external_id: shop['id'],
                name: shop['name'], 
                image_url:shop['image_url'], 
                url:shop['url'], 
                rating: shop['rating'], 
                latitude: shop['coordinates']['latitude'], longitude: shop['coordinates']['longitude'], location: shop['location']['display_address'][0],
                distance: shop['distance']
            }

            CoffeeShop.find_or_create_by(params)
        
        end
       
        render json: created_shops

    end

 

    private

    def cordinates_params
        
        params.permit(:latitude, :longitude, :location,:coffee_shop)
    end

end
