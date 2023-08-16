require 'csv'
require 'bundler'
Bundler.require

require 'sinatra/activerecord/rake'
# require 'lib/tasks/markets_csv_load.rake'
# Dir.glob('lib/tasks/*.rake').each { |r| load r}


namespace :csv_load do 
  desc 'markets'
  task markets: :environment do 
    csv_text = File.read("db/data/farmersmarkets.csv")
    csv = CSV.parse(csv_text, headers: true)
    csv.each do |row|
      t = Market.new
      t.name = row['listing_name']
      t.address = row['location_address']
      t.site = row['location_site']
      t.description = row['location_desc']
      t.fnap = row['FNAP']
      t.snap_option = row['SNAP_option']
      t.accepted_payment = row['acceptedpayment']
      t.longitude = row['location_x']
      t.latitude = row['location_y']
      t.created_at = row['update_time']
      t.save
    end
  end

  task all: :environment do
    desc "all"
      Rake::Task["csv_load:markets"].invoke
  end
end
