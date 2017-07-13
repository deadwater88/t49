require 'net/http'
require 'byebug'
require 'nokogiri'
require 'open-uri'
def fetch_by_BL(bl)
  url = URI.parse("https://www.pilship.com/shared/ajax/?fn=get_tracktrace_bl&ref_num=#{bl}")
  req = Net::HTTP::Get.new(url.to_s)
  req.add_field 'Accept', 'application/json'
  req.add_field 'Accept-Encoding', 'gzip'
  req.add_field 'Accept-Encoding', 'deflate'
  req.add_field 'Accept-Encoding', 'sdch'
  req.add_field 'Accept-Encoding', 'br'
  http = Net::HTTP.new(url.host, url.port)
  http.use_ssl = true
  res = http.start {|http|
    http.request(req)
  }

  parsed = res.body.force_encoding('utf-8')
  data = parsed.split('br')
  bl_number = bl
  shipline = 'PIL'
  origin = data[4].match(/>(\w+)</)[1]
  destination = data[14].match(/>Place of Delivery <b>(\w+) \[/)[1]
  vessel = data[6].match(/>([\w ]+)</)[1]
  voyage = data[7].match(/>([\w ]+)</)[1]
  vessel_eta = data[3].match(/>([\d-]+)</)[1]
  container = data[10].match(/wrapper_(\w+)/)[1]
  results = [bl_number, shipline, origin, destination, vessel, voyage, vessel_eta, container]
  p results
  # byebug
end

def parseBLresponse(res, bl)
  booking = Booking.new(bl_number: bl_number,
                        ship_line: shipline,
                        origin: origin,
                        destination: destination,
                        vessel: vessel,
                        voyage: voyage,
                        vessel_eta: vessel_eta)
  booking.save
  container = data[10].match(/wrapper_(\w+)/)[1]

end


fetch_by_BL('TXG790214500')

# url = URI.parse("https://www.pilship.com/shared/ajax/?fn=get_tracktrace_bl&ref_num=#{'TXG790195200'}")
# req = Net::HTTP::Get.new(url.to_s)
# req.add_field 'Accept', 'application/json'
# req.add_field 'Accept-Encoding', 'gzip'
# req.add_field 'Accept-Encoding', 'deflate'
# req.add_field 'Accept-Encoding', 'sdch'
# req.add_field 'Accept-Encoding', 'br'
#
#
# http = Net::HTTP.new(url.host, url.port)
# http.use_ssl = true
# res = http.start {|http|
#   http.request(req)
# }
#
# parsed = res.body.force_encoding('utf-8')
#
# parsed.split('br').each_with_index do |row, idx|
#   puts "index at #{idx}"
#   puts row
# end
#
# data = parsed.split('br')
#
# blnumber = 'TXG790195200'
# shipline = 'PIL'
# origin = data[4].match(/>(\w+)</)[1]
# destination = data[14].match(/>Place of Delivery <b>(\w+) \[/)[1]
# vessel = data[6].match(/>([\w ]+)</)[1]
# voyage = data[7].match(/>([\w ]+)</)[1]
# vessel_eta = data[3].match(/>([\d-]+)</)[1]
# container = data[10].match(/wrapper_(\w+)/)[1]
# byebug


#
# doc = Nokogiri::HTML(open('https://www.pilship.com/shared/ajax/?fn=get_tracktrace_bl&ref_num=TXG790195200&_=1499908331818')) do |config|
#   config.nononet
# end
