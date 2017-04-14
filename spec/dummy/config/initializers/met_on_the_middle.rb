ActiveSupport::Notifications.subscribe MetOnTheMiddle.configuration.notifications_event_matcher do |*args|
  event = ActiveSupport::Notifications::Event.new *args

  event.name      # => "process_action.action_controller"
  event.duration  # => 10 (in milliseconds)
  event.payload   # => {:extra=>information}

  Rails.logger.info "#{event.inspect} Received!"
  Rails.logger.info "----------"
end


