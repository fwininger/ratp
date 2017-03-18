require 'savon'

module Ratp
  # Request
  class Request
    def operations
      client.operations
    end

    def call(operation, _options = {})
      raise 'Not Found' unless operations.include?(operation)

      response = client.call(operation)
      response.body
    end

    private

    def client
      @client ||= Savon.client(wsdl: 'wsdl/Wsiv.wsdl')
    end
  end
end
