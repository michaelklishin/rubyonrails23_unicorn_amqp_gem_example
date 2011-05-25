listen 3000

worker_processes 1
timeout          30

preload_app true


after_fork do |server, worker|
  require "amqp"

  # the following is *required* for Rails + "preload_app true",
  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.establish_connection


  t = Thread.new { AMQP.start }
  sleep(1.0)

  EventMachine.next_tick do
    AMQP.channel ||= AMQP::Channel.new(AMQP.connection)
    AMQP.channel.queue("amqpgem.examples.rails23.warmup", :durable => true)

    3.times do |i|
      puts "[after_fork/amqp] Publishing a warmup message ##{i}"

      AMQP.channel.default_exchange.publish("A warmup message #{i} from #{Time.now.strftime('%H:%M:%S %m/%b/%Y')}", :routing_key => "amqpgem.examples.rails23.warmup")
    end
  end
end
