require 'net/http' 
require 'uri' 
require 'json'

uri = URI.parse("https://healthchecks.io/api/v1/checks/") 
request = Net::HTTP::Get.new(uri) 
request["X-Api-Key"] = "xxxxxxxxxxxxxxxxxxxxxxx" 
req_options = { use_ssl: uri.scheme == "https", } 

SCHEDULER.every '5m', :first_in => 0 do |job|

  response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http| 
    http.request(request) 
  end

  @data = JSON.parse(response.body)['checks']
  check = Hash.new

  @data.each do |item| 
     check_name = item["name"]
     check_status = item["status"]
     check[check_name] = { label: check_name, value: check_status }
  end
  send_event('healthcheck', { items: check.values })
end
