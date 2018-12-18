module CustomDateTimeFormat
  def normal_format
    strftime("%m/%d/%y %H:%M")
  end

  def only_date_format
    strftime("%m/%d/%y")
  end

  def only_month_day
    strftime("%m/%d")
  end

  def large_format
    strftime("%h %d, %Y %H:%M:%S")
  end
end

class Time
  include CustomDateTimeFormat  
end

class Date
  include CustomDateTimeFormat  
end

class DateTime
  include CustomDateTimeFormat  
end