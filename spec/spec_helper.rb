$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'toy_robot'
RSpec.configure do |config|
  config.mock_with :mocha
end
