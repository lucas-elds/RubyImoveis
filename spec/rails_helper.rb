# This file is copied to spec/ when you run 'rails generate rspec:install'
require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'

# Add additional requires below this line. Rails is not loaded until this point!

# Cobertura de testes (ative rodando: COVERAGE=true bundle exec rspec)
require 'simplecov'
SimpleCov.start 'rails' if ENV['COVERAGE'] == 'true'

# DatabaseCleaner para testes de sistema com JS
require 'database_cleaner/active_record'

# Requires supporting ruby files with custom matchers and macros, etc, in
# spec/support/ and its subdirectories.
# Rails.root.glob('spec/support/**/*.rb').sort_by(&:to_s).each { |f| require f }

# Checks for pending migrations and applies them before tests are run.
# If you are not using ActiveRecord, you can remove these lines.
begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  abort e.to_s.strip
end

RSpec.configure do |config|
  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_paths = [
    Rails.root.join('spec/fixtures')
  ]

  # Se não estiver usando ActiveRecord, comente
  config.use_transactional_fixtures = true

  # FactoryBot: permite usar create(:user) ao invés de FactoryBot.create(:user)
  config.include FactoryBot::Syntax::Methods

  # DatabaseCleaner setup
  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each) { DatabaseCleaner.start }
  config.before(:each, type: :system, js: true) { DatabaseCleaner.strategy = :truncation }
  config.after(:each)  { DatabaseCleaner.clean }

  # RSpec Rails pode inferir tipo de teste pelo caminho do arquivo
  config.infer_spec_type_from_file_location!

  # Filtra linhas de backtrace do Rails
  config.filter_rails_from_backtrace!
  # config.filter_gems_from_backtrace("gem name")
end

# Shoulda Matchers para validações e associações
Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end