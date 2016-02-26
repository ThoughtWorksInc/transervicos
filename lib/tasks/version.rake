require 'yaml'

namespace :version do
  namespace :up do
    task :patch do
      update_version('patch', +1)
    end

    task :minor do
      update_version('minor', +1)
    end

    task :major do
      update_version('major', +1)
    end
  end

  namespace :down do
    task :patch do
      update_version('patch', -1)
    end

    task :minor do
      update_version('minor', -1)
    end

    task :major do
      update_version('major', -1)
    end
  end
end

def update_version(field, version_modifier)
  file_path = "#{Rails.configuration.root}/config/version.yml"
  version = YAML.load_file(file_path)
  version[field] = version[field].to_i + version_modifier
  File.write(file_path, YAML.dump(version))
end
