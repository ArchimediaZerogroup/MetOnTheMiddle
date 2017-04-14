class Person < ActiveRecord::Base


  def to_s
    "#{self.surname}::#{self.name}"
  end

end
