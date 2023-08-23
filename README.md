# Introduction
This API is a service built to store farmers market data downloaded from the USDA Local Food Portal farmers market directory [here](https://www.usdalocalfoodportal.com/fe/datasharing/) and expose endpoints to access specific subsets of that data. The original intended use of this API is as a microservice for consumption by other component services of the Food Haven web application. This application was build using Ruby 3.2.2 and Rails 7.0.6

# Features
* Exposes 4 endpoints that return various subsets of farmers market info as JSON
* Stores the farmers markets in a Postgresql database.

# Installation

Should it be necessary to install this application on your local machine, follow these steps:
1. In your terminal, in the directory you intend to store this application, run
 - ```git clone git@github.com:FoodHaven/microservice-sinatra.git```
2. Enter the microservice-api directory and run the following commands:
 - ```bundle install```
 - ```rake db:{drop,create,migrate,seed}```
Bam. Pretty sure you good now.

# API Endpoints
`/api/v1/markets`
- This endpoint renders an index of all farmers markets

`/api/v1/markets/{:id}`
- Renders a JSON object for a single market by that market's id.

`/api/v1/markets/search?longitude={longitude}&latitude={latitude}&radius={radius}`
- Returns a list of markets within the radius of a specific latitude and longitude. Radius, latitude, and longitude are passed as query parameters when making a request to this endpoint.

`/api/v1/markets/favorites?market_ids[]={:id}&market_ids[]={:id}&market_ids[]={:id}`
- Renders a list of markets by their ids. Arrays of ids are passed as query parameters when making a request to this endpoint.

# Authors
## Kailey Kaes
#### [@kaileykaes](https://github.com/kaileykaes)
#### [LinkedIn](https://www.linkedin.com/in/kaileykaes/)

## Jesse Sorman
#### [@Jesse193](https://github.com/Jesse193)
#### [LinkedIn](https://www.linkedin.com/in/jesse-sorman/)

## Andy Stilmock
#### [@AStilmock](https://github.com/AStilmock)
#### [LinkedIn](https://www.linkedin.com/in/andrew-stilmock-9ba598270/)

## Kim Bergstrom
#### [@kbergstrom78](https://github.com/kbergstrom78)
#### [LinkedIn](https://www.linkedin.com/in/kimberley-bergstrom/)

# Sources:
USDA’s Agricultural Marketing Service &amp; Michigan State University. (n.d.). USDA local food directories. USDA Local Food Directories. https://www.usdalocalfoodportal.com/fe/datasharing/