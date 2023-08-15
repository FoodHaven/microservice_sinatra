# set the database based on the current environment
database_name = "microservice_sinatra_#{Microservice.environment}"

# connect ActiveRecord with the current database
ActiveRecord::Base.establish_connection(
  adapter: 'postgresql',
  database: "#{database_name}",
)