# frozen_string_literal: true

# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative "config/application"

Rails.application.load_tasks
require "faraday"
require "pry"
desc "Pulls Carpark Static Data."

task carpark_static: :environment do
  response = Faraday.get "https://data.gov.sg/api/action/datastore_search?resource_id=139a3035-e624-4f56-b63f-89ae28d4ae4c&limit=2000"
  results = JSON.parse(response.body)["result"]["records"]
  results.each do |r|
    carpark = Carpark.new
    carpark.short_term_parking = r["short_term_parking"]
    carpark.carpark_type = r["car_park_type"]
    carpark.y_coord = r["y_coord"]
    carpark.x_coord = r["x_coord"]
    carpark.free_parking = !(r["free_parking"] == "NO")
    carpark.address = r["address"]
    carpark.carpark_decks = r["car_park_decks"]
    carpark.source_id = r["_id"]
    carpark.carpark_no = r["car_park_no"]
    carpark.type_of_parking_system = r["type_of_parking_system"]
    carpark.gantry_height = r["gantry_height"].to_f
    carpark.night_parking = !(r["car_park_basement"] == "NO")
    carpark.carpark_basement = !(r["car_park_basement"] == "N")
    carpark.save
  end
end

task carpark_lots: :environment do
  response = Faraday.get "https://api.data.gov.sg/v1/transport/carpark-availability"
  results = JSON.parse(response.body)["items"].first["carpark_data"]

  carparks = Carpark.all
  results.each do |r|
    carpark_no = r["carpark_number"]
    carpark = Carpark.find_by(carpark_no: carpark_no)
    unless carpark.nil?
      info = r["carpark_info"].first
      carpark_lot = carpark.carpark_lot.nil? ? CarparkLot.new : carpark.carpark_lot
      carpark_lot.total_lots = info["total_lots"].to_i
      carpark_lot.lots_available = info["lots_available"].to_i
      carpark.carpark_lot = carpark_lot
      carpark.save
    end
  end
end
