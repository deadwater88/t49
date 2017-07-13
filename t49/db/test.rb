require 'net/http'
require 'byebug'
require 'nokogiri'
require 'open-uri'


url = URI.parse('https://www.pilship.com/shared/ajax/?fn=get_tracktrace_bl&ref_num=TXG790195200&_')
req = Net::HTTP::Get.new(url.to_s)
byebug
http = Net::HTTP.new('www.pilship.com', url.port)
http.use_ssl = true
res = http.start {|http|
  http.request(req)
}
# 
# doc = Nokogiri::HTML(open('https://www.pilship.com/shared/ajax/?fn=get_tracktrace_bl&ref_num=TXG790195200&_'))
byebug

puts "shot"
puts res.body
