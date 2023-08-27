# set the database based on the current environment
database_name = "microservice_sinatra_#{Microservice.environment}"

db = URI.parse( ENV['DATABASE_URL'] || "postgres://localhost/#{database_name}")

# connect ActiveRecord with the current database
ActiveRecord::Base.establish_connection(
  adapter: 'postgresql',
  database: "#{database_name}",
  encoding: "utf8"
)