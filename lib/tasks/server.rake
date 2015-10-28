namespace :server do
  desc "Start rails server with correct ports and binding"
  task :start do    
    exec "rails server -p 8080 -b 0.0.0.0"
  end
end
