require 'sinatra/base'
require 'sinatra/custom_logger'
require 'logger'
require 'et_fake_acas_server/json_server'

module EtFakeAcasServer
  class Server < Sinatra::Base
    post(/\/ECCLJson/) { JsonServer.call(env) }
  end
end
