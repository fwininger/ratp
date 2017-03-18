require 'ratp/request'

# Main class
module Ratp
  class << self
    def lines
      request.call(:get_lines)
    end

    def stations
      request.call(:get_stations)
    end

    def missions_next
      request.call(:get_missions_next)
    end

    def mission
      request.call(:get_mission)
    end

    def directions
      request.call(:get_directions)
    end

    def missions_frequency
      request.call(:get_missions_frequency)
    end

    def missions_first_last
      request.call(:get_missions_first_last)
    end

    def perturbations
      request.call(:get_perturbations)
    end

    def geo_points
      request.call(:get_geo_points)
    end

    def version
      request.call(:get_version)
    end

    private

    def request
      @request ||= Request.new
    end
  end
end
