require 'json'
require 'net/http'

module Ratp
  # Allow to search lines ids on STIF reference
  class LinesReference
    REFERENCE_URL = 'https://opendata.stif.info/explore/dataset/referentiel-des-lignes-stif/download?format=json&timezone=Europe/Berlin&use_labels_for_header=true'.freeze

    def find_by(options = {})
      res = lines

      options.each do |key, value|
        res.select! { |line| line[key] == value }
      end

      res
    end

    def lines
      data.map { |x| x[:fields] }
    end

    def data
      @lines_reference ||= JSON.parse(raw_data, symbolize_names: true)
    end

    def raw_data
      Net::HTTP.get(URI(REFERENCE_URL))
    end
  end
end
