require "sinatra"
require_relative "authentication.rb"
require_relative "user.rb"
<<<<<<< HEAD
=======
require_relative "listing.rb"

>>>>>>> 7dbc349fa62867787d738822a42e113d1db58d67

#the following urls are included in authentication.rb
# GET /login
# GET /logout
# GET /sign_up

# authenticate! will make sure that the user is signed in, if they are not they will be redirected to the login page
# if the user is signed in, current_user will refer to the signed in user object.
# if they are not signed in, current_user will be nil

get "/" do
	erb :index
end
#Tarana Mou

get "/dashboard" do
	authenticate!
	erb :dashboard
end
<<<<<<< HEAD

=======
>>>>>>> 7dbc349fa62867787d738822a42e113d1db58d67
