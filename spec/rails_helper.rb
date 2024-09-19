# frozen_string_literal: true

# spec/rails_helper.rb
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
end
