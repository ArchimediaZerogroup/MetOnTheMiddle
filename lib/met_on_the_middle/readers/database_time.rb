module MetOnTheMiddle::Readers
  class DatabaseTime < Base

    def initialize
      super :database_time
    end

    def match_subscription
      'sql.active_record'
    end

    def parse(e, request: nil)
      return e.duration if request.nil?
      (e.duration+(request.get(key)||0)).round(2)
    end

  end
end