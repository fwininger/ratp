require 'json'
require 'net/http'

module Ratp
  # Allow to search lines ids on STIF reference
  class StationsReference
    REFERENCE_URL = 'https://opendata.stif.info//explore/dataset/referentiel-arret-tc-idf/download?format=json&timezone=Europe/Berlin&use_labels_for_header=true'.freeze

    def find_by(options = {})
      res = stations

      options.each do |key, value|
        res.select! { |station| station[key] == value }
      end

      res
    end

    def stations
      data.map { |x| x[:fields] }
    end

    def data
      @stations_reference ||= JSON.parse(raw_data, symbolize_names: true)
    end

    def raw_data
      Net::HTTP.get(URI(REFERENCE_URL))
    end
  end
end
