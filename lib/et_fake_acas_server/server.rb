require 'sinatra/base'
require 'sinatra/custom_logger'
require 'logger'
require 'et_fake_acas_server/soap_server'
require 'et_fake_acas_server/json_server'

module EtFakeAcasServer
  class Server < Sinatra::Base
    post(/\/Lookup\/.*/) { SoapServer.call(env) }
    post(/\/ECCLJson/) { JsonServer.call(env) }
  end
end
