class DateGenerator

  def self.default_date
    Date::today.strftime("%d%m%y").delete("/")
  end

end
