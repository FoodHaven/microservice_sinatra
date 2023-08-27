# set the database based on the current environment
database_name = "microservice_sinatra_#{Microservice.environment}"

db = URI.parse( ENV['DATABASE_URL'] || "postgres://localhost/#{database_name}")

configure :development do

# connect ActiveRecord with the current database
ActiveRecord::Base.establish_connection(
  adapter: db.scheme == "postgres" ? "postgresql" : db.scheme,
  database: "#{database_name}",
  encoding: "utf8"
)
end

configure :production do
  # connect ActiveRecord with the current database
  ActiveRecord::Base.establish_connection(
    # adapter: 'postgresql',
    adapter: db.scheme == "postgres" ? "postgresql" : db.scheme,
    host: db.host,
    port: db.port,
    username: db.user,
    password: db.password,
    database: "#{database_name}",
    encoding: "utf8"
  )
end