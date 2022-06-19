# frozen_string_literal: true

require 'rack/test'

RSpec.configure do |config|
  config.include Rack::Test::Methods

  RSpec::Matchers.define :each_valid do |validation|
    match do |expected|
      validated = expected.map do |value|
        validation.new.call(value).to_h
      end
      validated == expected
    end
    failure_message do |array|
      array.map do |item|
        validation_output(expected, item)
      end
    end
  end

  RSpec::Matchers.define :valid do |validation|
    match do |expected|
      validation.new.call(expected).to_h == expected
    end
    failure_message do |actual|
      validation_output(expected, actual)
    end
  end
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
end
