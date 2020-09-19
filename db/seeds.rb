# require 'rest-client'

# # RestClient.get(URL, HEADERS)
# x = RestClient.get('https://api.yelp.com/v3/businesses/search', {
#     Authorization: "Bearer #{ENV["YELP_API_KEY"]}",
#     params: {
#         location: 'brooklyn',
#         term: 'coffee shops'
#     }
#     }) 

# puts x
