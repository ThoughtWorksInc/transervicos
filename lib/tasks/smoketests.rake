require 'net/https'
require 'uri'
require 'json'

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
