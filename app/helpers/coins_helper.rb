module CoinsHelper
  def time_frame(start_date = nil)
    current = Time.zone.now
    start_date = current - 24.hours if start_date.nil?
    [start_date, current]
  end
end
