require 'rest-client'
require 'logger'
require 'pry'

class SmartBuffer
  def initialize(max_size)
    @buffer = []
    @max_size = max_size 
  end

  def enqueue(message)
    @buffer.push(message)
  end

  def dequeue
    @buffer.shift
  end

  def max_size
    @max_size
  end

  def size
    @buffer.size
  end

  def empty?
    @buffer.empty?
  end

  def maxed_out?
    self.size > self.max_size
  end
end

logger = Logger.new File.new('smart_message_poller_log.log','w')

buffer = SmartBuffer.new(3)

poller = Thread.new do
  loop do
    # raise "The buffer has reached a size of 3" if buffer.maxed_out?
    message = RestClient.get 'http://message-provider.herokuapp.com/get_message'
    buffer.enqueue message
    puts "pulled a message - current buffer size: #{buffer.size}" 
    logger.info "pulled a message - current buffer size: #{buffer.size}"
    sleep 0.1
  end
end

processor = Thread.new do
  loop do
    raise "The buffer has reached a size of 3" if buffer.maxed_out?
    if !buffer.empty?
      message = buffer.dequeue
      puts "processed a message - current buffer size: #{buffer.size}"      
      logger.info "processed a message - current buffer size: #{buffer.size}"
      sleep [0.1, 2.0].sample
    end
  end
end

[poller, processor].each(&:join)