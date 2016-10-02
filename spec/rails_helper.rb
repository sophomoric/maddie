ENV["RAILS_ENV"] ||= 'test'
require 'spec_helper'
require "support/database_cleaner"
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require "factory_girl"
require "support/factory_girl"
require "support/host_helper"
require 'shoulda/matchers'

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end

ActiveRecord::Migration.check_pending!

RSpec.configure do |config|
  config.include Rails.application.routes.url_helpers
  Rails.application.routes.default_url_options[:host] = 'localhost:3000'
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = false
  config.include Devise::Test::ControllerHelpers, type: :controller
  config.include HostHelper, type: :feature
  config.infer_spec_type_from_file_location!
end

Capybara.javascript_driver = :webkit

Capybara::Webkit.configure do |config|
  config.block_unknown_urls
end

