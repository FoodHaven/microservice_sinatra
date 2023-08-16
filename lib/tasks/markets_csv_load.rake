require 'csv'
require './app/models/market'

namespace :csv_load do 
  # desc 'markets'
  task markets: :environment do 
    csv = CSV.foreach("./db/data/farmersmarkets.csv", :headers => true) do |row|
      Market.create!(
        id: row['id'],
        name: row['listing_name'],
        address: row['location_address'],
        site: row['location_site'],
        description: row['location_desc'],
        fnap: row['FNAP'],
        snap_option: row['SNAP_option'],
        accepted_payment: row['acceptedpayment'],
        longitude: row['location_x'],
        latitude: row['location_y']
      )
    end
    ActiveRecord::Base.connection.reset_pk_sequence!('markets')
  end

  task all: :environment do
    # desc "all"
      Rake::Task["csv_load:markets"].execute
  end
end

#look into foreach
