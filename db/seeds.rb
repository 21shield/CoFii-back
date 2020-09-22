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
    avatar: "https://images.unsplash.com/photo-1534278931827-8a259344abe7?ixlib=rb-1.2.1&w=1000&q=80",
 
})

puts "DONE SEEDINGS"