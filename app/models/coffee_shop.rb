require 'rest-client'

class CoffeeShop < ApplicationRecord
    has_many :comments
    validates :external_id, :uniqueness => true

    def self.getShops(coords)
        # class method

      RestClient.get('https://api.yelp.com/v3/businesses/search', {
        Authorization: "Bearer #{ENV["YELP_API_KEY"]}",
        params: {
            term: 'coffee shops',
            latitude: "#{coords[:latitude]}",
            longitude: "#{coords[:longitude]}",
            attributes: "gender_neutral_restrooms, free_wi-fi, good_for_working"
        }
        })
        
    end
   


end
