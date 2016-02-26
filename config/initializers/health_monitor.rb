HealthMonitor.configure do |config|
  config.database
  version = YAML.load_file("#{Rails.configuration.root}/config/version.yml")

  config.environmet_variables = {
    version: version.inject('') { |c, (_k, v)| c + "#{v}." }.chop,
    migration_version: ActiveRecord::Migrator.current_version
  }
end
