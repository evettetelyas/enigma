class DateGenerator

  def default_date
    array = []
    configured_date = Date::today.strftime.split("-")
    year = configured_date[0].chars.pop(2).join
    array.push(configured_date[2], configured_date[1], year).flatten
    array.join
  end

end
