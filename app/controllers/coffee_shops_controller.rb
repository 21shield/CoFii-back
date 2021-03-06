class CoffeeShopsController < ApplicationController
    skip_before_action :authenticate, only: :index

    def index
        coffeeShops = CoffeeShop.all
        render json: coffeeShops
    end

    def loadShops
       
        # response = CoffeeShop.getShops(cordinates_params)
        # create/findor create by shops is a array of objs
        data = JSON.parse(CoffeeShop.getShops(cordinates_params).body)
        created_shops = data['businesses'].map do |shop|
            address = shop['location']['display_address'].join("")
            catArr = shop['categories'].collect { |cat| cat['title']}
            categories = catArr.join(",")
            params = {
                external_id: shop['id'],
                name: shop['name'], 
                image_url:shop['image_url'], 
                categories: categories,
                url:shop['url'], 
                rating: shop['rating'], 
                latitude: shop['coordinates']['latitude'], 
                longitude: shop['coordinates']['longitude'], 
                location: address,
                distance: shop['distance']
            }

            CoffeeShop.find_or_create_by(params)
        
        end
        render json: created_shops, each_serializer: CoffeeShopSerializer, include: '**'

    end

 

    private

    def cordinates_params
        
        params.permit(:latitude, :longitude, :location)
    end

end
