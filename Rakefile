# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.
require 'net/https'
require 'uri'
require 'json'

require File.expand_path('../config/application', __FILE__)

Rails.application.load_tasks

namespace :smoketest do
  task :development do
    uri = URI.parse('http://localhost:8080/check')
    check(uri)
  end

  task :production do
    uri = URI.parse('http://transervicos.herokuapp.com/check')
    check(uri)
  end
end

def check(uri)
  http = Net::HTTP.new(uri.host, uri.port)

  request = Net::HTTP::Get.new(uri.request_uri)
  res = http.request(request)

  fail "Application is not ok! Status: #{res.code}" if res.code != '200'
  puts "Application is ok! Status: #{res.code}"
  puts JSON.parse(res.body)
end
