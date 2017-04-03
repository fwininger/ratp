module Ratp
  # Base class for STIF Real Time Api
  class Monitoring
    STIF_BASE_URL = 'https://api-lab-trone-stif.opendata.stif.info/service/tr-unitaire-stif/stop-monitoring?MonitoringRef=STIF:StopPoint:Q:'.freeze

    def initialize(api_key)
      @api_key = api_key
    end

    def data(stop_point)
      JSON.parse(raw_data(stop_point), symbolize_names: true)
    end

    def raw_data(stop_point)
      Net::HTTP.get(URI(STIF_BASE_URL + stop_point + ':&apikey=' + @api_key))
    end
  end
end
