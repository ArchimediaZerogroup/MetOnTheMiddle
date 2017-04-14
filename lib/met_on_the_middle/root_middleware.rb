module MetOnTheMiddle
  class RootMiddleware

    def initialize(app)
      @app = app
    end

    ##
    # Serve per essere multy trade safe
    def call(env)
      dup._call(env)
    end

    def _call(env)

      #se è presente il parametro nel body di dati da decriptare
      # request = Rack::Request.new(env)
      # if request.params.key?(@encrypt_parameter)
      #   dati_criptati = request.params[@encrypt_parameter]
      #   #se ha messo dei valori nella chiave,utilizziamo quelli e lasciamo stare il body
      #   if dati_criptati.blank?
      #     dati_criptati = request.body.read if request.put? or request.post?
      #   end
      #   data = self.class.decrypt(Base64.decode64(dati_criptati), pass, iv, "AES-128-CBC")
      #
      #   JSON.parse(data).each do |k, v|
      #     request.update_param(k, v)
      #   end
      # end


      status, headers, response = @app.call(env)

      #qua non dovremmo far altro che spedire a zabbix i dati

      Rails.logger.debug {status.inspect}
      Rails.logger.debug {headers.inspect}
      Rails.logger.debug {response.inspect}


      [status, headers, response]
    end

  end
end