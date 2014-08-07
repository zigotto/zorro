$:.unshift File.dirname(__FILE__) + '/../lib'

require 'zorro'

RSpec.configure do |config|
  Kernel.srand config.seed

  config.filter_run :focus
  config.run_all_when_everything_filtered = true
  config.profile_examples = 10
  config.order = :random

  if config.files_to_run.one?
    config.default_formatter = 'doc'
  end

  config.expect_with :rspec do |expectations|
    expectations.syntax = :expect
  end

  config.mock_with :rspec do |mocks|
    mocks.syntax = :expect
    mocks.verify_partial_doubles = true
  end
end
