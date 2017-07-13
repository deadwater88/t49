class BookingsController < ApplicationController

  def show
    bl = params[:id]

    res = fetch_by_BL(bl)

    container = parseBLresponse(res)

  end

  def parseBLresponse(res, bl)
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

    @booking = Booking.new(bl_number: bl_number,
                          ship_line: shipline,
                          origin: origin,
                          destination: destination,
                          vessel: vessel,
                          voyage: voyage,
                          vessel_eta: vessel_eta)
    booking.save
    container = data[10].match(/wrapper_(\w+)/)[1]
    @booking
  end

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
  end

  def fetch_by_container

  end



end
