RSpec.configure do |config|
  config.before(:suite) do
    tables_to_keep = %w[roles areas_de_atuacao]
    DatabaseCleaner.clean_with :truncation, except: tables_to_keep
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end
