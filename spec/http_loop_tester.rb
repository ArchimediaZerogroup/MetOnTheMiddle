require 'curb'

loop do
  begin
    puts "ok"
    Curl::Easy.perform("http://0.0.0.0:3000")
  rescue Exception => e
    puts "Problema"
  end
  # sleep 0.05
end