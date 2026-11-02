require 'sinatra/base'
require 'sinatra/custom_logger'
require 'logger'
require 'et_fake_acas_server/json_server'

module EtFakeAcasServer
  class Server < Sinatra::Base
    configure :development, :production do
      logger = Logger.new(STDOUT)
      logger.level = Logger::DEBUG
      set :logger, logger
      set :host_authorization, { permitted_hosts: [] }
    end

    post(/\/ECCLJson/) { JsonServer.call(env) }
  end
end
