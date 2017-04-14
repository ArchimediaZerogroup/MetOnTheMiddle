module MetOnTheMiddle
  class Railtie < Rails::Railtie


    generators do
      require File.expand_path('../../../lib/met_on_the_middle/generators/install_generator', __FILE__)
    end

    initializer "met_on_the_middle.append_root_middleware" do |app|
      app.middleware.insert_before(Rack::Sendfile, 'MetOnTheMiddle::RootMiddleware')
    end


    initializer "met_on_the_middle.define_notification_subscription" do

      ActiveSupport::Notifications.subscribe MetOnTheMiddle.configuration.notifications_event_matcher do |*args|
        event = ActiveSupport::Notifications::Event.new *args

        event.name # => "process_action.action_controller"
        event.duration # => 10 (in milliseconds)
        event.payload # => {:extra=>information}

        Rails.logger.info "#{event.inspect} Received!"
        Rails.logger.info "----------"
      end

    end


  end
end