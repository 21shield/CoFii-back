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
User.destroy_all

User.create({
    username: "barb", 
    email: "barb@gmail.com",
    password: "asdf",
    password_confirmation: "asdf",
    bio:"I love Chocolate cookies",
 
})

puts "DONE SEEDINGS"