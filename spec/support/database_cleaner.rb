RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation, except: %w[spatial_ref_sys])
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :deletion, { except: %w[spatial_ref_sys] }
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.append_after(:each) do
    DatabaseCleaner.clean
  end
end