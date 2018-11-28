require 'data_mapper'

if ENV['DATABASE_URL']
  DataMapper::setup(:default, ENV['DATABASE_URL'] || 'postgres://localhost/mydb')
else
  DataMapper::setup(:default, "sqlite3://#{Dir.pwd}/app.db")
end

class Listing
    include DataMapper::Resource
    property :id, Serial
    property :title, Text
    property :logo, Text
    property :description, Text
    property :skills, Text
    property :l_url, Text
    property :location, Text
    property :company, Text
    property :count, Integer

end

get '/listings' do
   authenticate!
  if (current_user.pro == false)
 @lasting = Listing.all(:id.gt => 0, :id.lt => 5)
   
   

   erb :listings
 else

#if params["preferred_location"]

#@lasting = Listing.all(:count.gt => 3,:location => current_user.preferred_location)
#@lasting = Listing.all(:count => 3,:location => current_user.preferred_location)

#@lasting = Listing.all(:count => 2,:location => current_user.preferred_location)
#erb :listings
#else

  #@lasting = Listing.all(:count.gt => 3)
 @lasting = Listing.all(:count =>3) 
@lasting = Listing.all(:count =>2) 

#erb :listings
#end
end
end

get '/listings/new' do
   authenticate!
   #administrator!
   erb :new_listing
end

#adds a new listing to the database
post '/create' do
   if params["title"] && params["description"] && params["logo"] && params["l_url"] && params["skills"] && params["company"] && params["location"]
      j = Listing.new
      j.title = params["title"]
      j.description = params["description"]
      j.logo = params["logo"]
      j.l_url = params["l_url"]
      j.skills = params["skills"]
      j.company = params["company"]
      j.location = params["location"]
      j.save
      return erb :new_listing
   else
      return "Error! You're missing a parameter. "
   end
end

