require 'mock_redis'

redis_instance = MockRedis.new

RSpec.configure do |config|
  config.before(:each, redis_mock: true) do
    allow(Redis).to receive(:new).and_return(redis_instance)
    allow(Redis).to receive(:current).and_return(redis_instance)
  end
end
