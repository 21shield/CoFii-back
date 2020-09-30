require 'rest-client'

class CoffeeShop < ApplicationRecord
    has_many :comments
    has_many :favorites
    validates :external_id, :uniqueness => true

    def self.getShops(coords)
        # class method
        search = coords[:location] ? ({
            term: 'coffee shops',
            location:"#{coords[:location]}",
            attributes: "gender_neutral_restrooms, free_wi-fi, good_for_working"
        }) : ({
            term: 'coffee shops',
            latitude: "#{coords[:latitude]}",
            longitude: "#{coords[:longitude]}",
            attributes: "gender_neutral_restrooms, free_wi-fi, good_for_working"
        })

      RestClient.get('https://api.yelp.com/v3/businesses/search', {
        Authorization: "Bearer #{ENV["YELP_API_KEY"]}",
        params: search
        })
        
    end
   


end
