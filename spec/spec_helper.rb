require_relative '../lib/rostering.rb'
require_relative 'support/date_spec_helpers'
require_relative 'support/roster_matchers'

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
end

def sample_data_filename(filename)
  File.join(File.dirname(__FILE__), 'sample_data', filename)
end
