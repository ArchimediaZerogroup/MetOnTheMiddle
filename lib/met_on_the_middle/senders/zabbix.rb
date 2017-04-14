require 'socket'
require 'zabbix_protocol'

SERVER_PORT = 10051


module MetOnTheMiddle::Senders
  class Zabbix < Base


    attr_accessor :server_host, :port, :identify_host

    ##
    # Inizializzatore, configurazioni:
    #
    # server_host: host del server
    # port: porta del server
    # identify_host: nome dell'host da cui partono i dati
    def initialize(cfgs)
      self.server_host= cfgs[:server_host]
      self.port= cfgs[:port]
      self.identify_host= cfgs[:identify_host]
    end

    def write(request)
      TCPSocket.open(server_host, port) do |sock|
        datas = []
        request.data.each do |k, v|
          datas<<{"key":k,"value":v}
        end

        data = {
            "request" => "sender data",
            "data" =>datas.collect{|d| d.merge("host" => identify_host)}
        }

        sock.print ZabbixProtocol.dump(data)
        #p ZabbixProtocol.load(sock.read)
        #=> {"response"=>"success", "info"=>"Processed 0 Failed 1 Total 1 Seconds spent 0.000018"}
      end
    end


  end
end