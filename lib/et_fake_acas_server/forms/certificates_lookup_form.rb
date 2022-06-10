require 'base64'
require 'active_support'
require 'active_support/core_ext/string'
module EtFakeAcasServer
  class CertificatesLookupForm
    def initialize(payload)
      self.payload = JSON.parse(payload)
    end

    def validate

    end

    def certificate_numbers
      payload['CertificateNumbers']
    end

    private

    attr_accessor :payload
  end
end
