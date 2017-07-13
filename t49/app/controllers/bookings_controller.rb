require 'net/http'
require 'byebug'
require 'nokogiri'
require 'open-uri'

class BookingsController < ApplicationController

  def show
    bl = params[:id]
    @booking = Booking.find_by(bl_number: bl)
    if @booking && (Time.now - @booking.updated_at) < 900
      render :show
    else
      res = fetch_by_BL(bl)
      if res.message == "OK"
        @booking = parse_bl_response(res, bl)
        render :show
      else
        render json: ['Booking could not be found'], status: 404
      end
    end
  end

  def parse_bl_response(res, bl)
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
    @booking = Booking.find_by(bl_number: bl_number)

    if @booking
      @booking.update_attributes(bl_number: bl_number,
                             ship_line: shipline,
                             origin: origin,
                             destination: destination,
                             vessel: vessel,
                             voyage: voyage,
                             vessel_eta: vessel_eta)
    else
      @booking = Booking.new(bl_number: bl_number,
                           ship_line: shipline,
                           origin: origin,
                           destination: destination,
                           vessel: vessel,
                           voyage: voyage,
                           vessel_eta: vessel_eta)
      @booking.save
    end
    container = data[10].match(/wrapper_(\w+)/)[1]
    fetch_by_container(container, bl)
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
    res = http.start {|http| http.request(req) }
  end

  def fetch_by_container(container_number, bl)

    url = URI.parse("https://www.pilship.com/shared/ajax/?fn=get_track_container_status&search_type=bl&search_type_no=#{bl}&ref_num=#{container_number}")
    req = Net::HTTP::Get.new(url.to_s)
    req.add_field 'Accept', 'application/json'
    req.add_field 'Accept-Encoding', 'gzip'
    req.add_field 'Accept-Encoding', 'deflate'
    req.add_field 'Accept-Encoding', 'sdch'
    req.add_field 'Accept-Encoding', 'br'
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    res = http.start {|http| http.request(req) }
    parsed = res.body.force_encoding('utf-8')
    data = parsed.split('tr><tr')
    time = /\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2}/
  end



end
