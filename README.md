# Fetch Museums

Fetch Museums is a simple rails app that will take in a user's input of geo-coordinates and return a JSON response of its nearby museums via Mapbox Search API.

## Deployment
**Step 1**:  
Run bundle install to ensure that the ruby gems required for this project is available  
```sh
bundle install
```

**Step 2**:  
Create a .env file at the root of the project folder  

**Step 3**:  
Login / Create a MapBox account and retrieve an API key 

**Step 4**:  
Add in an entry for your Mapbox API key in the /env file created at Step 2 as follows
```sh
MAPBOX_API_KEY=YourMapBoxAPIkey
```

**Step 5**:  
Run your rails server with the following  
```sh
rails s
```

## Testing
Run the following in your terminal  
```sh
rails test test/controllers/pages_controller_test.rb
```

## Personal Reflection
I had a good revision on fetching / calling an api in Ruby and handling the JSON response accordingly.  
This was also my first testing I've done in Rails. I've yet to implement integraton tests and I'm looking forward to it.
