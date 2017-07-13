require 'net/http'



url = URI.parse('https://www.pilship.com/shared/ajax/?fn=get_tracktrace_bl&ref_num=TXG790195200&_')
req = Net::HTTP::Get.new(url.to_s)
res = Net::HTTP.start(url.host, url.port) {|http|
  http.request(req)
}
debugger
puts res.body
