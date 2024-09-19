# frozen_string_literal: true

# spec/rails_helper.rb
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rspec/rails'

RSpec.configure do |config|
  config.use_transactional_fixtures = true

  config.before(:suite) do
    # Check for pending migrations and apply them
    ActiveRecord::Migration.maintain_test_schema!
  end

  config.include FactoryBot::Syntax::Methods
end
