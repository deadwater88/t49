class ShipFetcherWorker
  include Sidekiq::Worker

  def perform(*args)
    loop do
      puts "Fetching bookings"
      bookings = Booking.where(watch: true)
      bookings.each do |booking|
        booking.update
        sleep(1)
      end
      sleep(14400)
    end
    # Sleeps 4 hours
  end
end
