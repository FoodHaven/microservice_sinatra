# Introduction
This API is a service built to store farmers market data downloaded from the USDA Local Food Portal farmers market directory [here](https://www.usdalocalfoodportal.com/fe/datasharing/) and expose endpoints to access specific subsets of that data. The original intended use of this API is as a microservice for consumption by other component services of the Food Haven web application. This application was built using Ruby 3.2.2 and Sinatra 3.1.0.

# Features
* Exposes 4 endpoints that return various subsets of farmers market info as JSON
* Stores the farmers markets in a Postgresql database. 

# Set Up
Should it be necessary to install this application on your local machine, follow these steps: 
1. In your terminal, in the directory you intend to store this application, run 
 - ```git clone git@github.com:FoodHaven/microservice-sinatra.git```
2. Enter the microservice-sinatra directory and run the following commands: 
 - ```bundle install```
 - ```rake db:{drop,create,migrate,seed}```
   ```rake db:prepare:test```
3. To run this application locally, run this from the command line: 
 - ```bundle exec rackup config.ru```

# API Endpoints
`/markets`
- Renders an index of all farmers markets in the database.

`/markets/{:id}`
- Renders a JSON object for a single market by that market's id.

`/markets/search?longitude={longitude}&latitude={latitude}&radius={radius}`
- Returns a list of markets within the radius of a specific latitude and longitude. Radius, latitude and longitude are passed as query parameters when making a request to this endpoint.

`/markets/favorites?market_ids[]={:id}&market_ids[]={:id}&market_ids[]={:id}`
- Renders a list of markets by their ids. Arrays of ids are passed as query parameters when making a request to this endpoint. 

`/`
- This simply prints "Hello World." An artifact of debugging our problems. Use it as a tool if you need.

# Contributors
## Kailey Kaes
#### [@kaileykaes](https://github.com/kaileykaes) 
#### [LinkedIn](https://www.linkedin.com/in/kaileykaes/)

## Jesse Sorman
#### [@Jesse193](https://github.com/Jesse193) 
#### [LinkedIn](https://www.linkedin.com/in/jesse-sorman/)

## Kim Bergstrom
#### [@kbergstrom78](https://github.com/kbergstrom78)
#### [LinkedIn](https://www.linkedin.com/in/kimberley-bergstrom/)

# Sources: 
USDA’s Agricultural Marketing Service &amp; Michigan State University. (n.d.). USDA local food directories. USDA Local Food Directories. https://www.usdalocalfoodportal.com/fe/datasharing/ 