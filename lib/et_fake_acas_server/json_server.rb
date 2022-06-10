require 'sinatra/base'
require 'sinatra/custom_logger'
require 'logger'
require 'et_fake_acas_server/forms/certificates_lookup_form'
require 'active_support'
require 'active_support/core_ext/numeric/time'
require 'base64'


module EtFakeAcasServer
  class JsonServer < Sinatra::Base
    def initialize(*)
      super
      self.subscription_key = ENV.fetch('ACAS_JSON_SUBSCRIPTION_KEY', 'fakesubscriptionkeyfortesting')
    end

    configure :development, :production do
      logger = Logger.new(STDOUT)
      logger.level = Logger::DEBUG
      set :logger, logger
    end

    post '/ECCLJson' do
      form = CertificatesLookupForm.new(request.body.read)
      request.body.rewind
      form.validate
      json = form.certificate_numbers.map do |certificate_number|
        case certificate_number
        when /\A(R|NE|MU)000200/ then
          json_builder_for_no_match(certificate_number)
        else
          json_builder_for_found(certificate_number)
        end
      end
      JSON.pretty_generate(json)
    end

    private

    attr_accessor :subscription_key

    def json_builder_for_no_match(certificate_number)
      {
        CertificateNumber: certificate_number,
        CertificateDocument: 'not found'
      }
    end

    def json_builder_for_found(certificate_number)
      {
        CertificateNumber: certificate_number,
        CertificateDocument: dummy_certificate_as_base_64
      }
    end

    def dummy_certificate_as_base_64
      filename = File.absolute_path(File.join('..', 'pdfs', '76 EC (C) Certificate R000080.pdf'), __dir__)
      Base64.encode64(File.read(filename))
    end
  end
end

