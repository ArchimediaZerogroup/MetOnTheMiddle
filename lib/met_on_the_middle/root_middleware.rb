module MetOnTheMiddle
  class RootMiddleware


    attr_reader :tracker

    def initialize(app)
      @app = app

      @tracker = Tracker.new(MetOnTheMiddle.configuration)
      @tracker.start!

      ##
      # TODO trovare sistema migliore per individuare se siamo lanciati tramite
      # rake oppure tramite server
      unless File.basename($0) == 'rake'
        register_subscriptions
      end

    end

    ##
    # Serve per essere multy trade safe
    def call(env)
      dup._call(env)
    end

    def _call(env)
      response = nil

      @tracker.request_block do

        ActiveSupport::Notifications.instrument "met_on_the_middle.total_time" do
          response = @app.call(env)
        end

      end


      response
    end


    def register_subscriptions
      MetOnTheMiddle.configuration.readers.each do |r|
        r.register_subscription(@tracker)
      end
    end


  end
end