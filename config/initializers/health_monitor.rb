HealthMonitor.configure do |config|
  config.database

  config.environmet_variables = {
    version: Rails.configuration.version,
    migration_version: ActiveRecord::Migrator.current_version
  }
end
