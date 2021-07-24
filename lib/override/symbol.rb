class Symbol
  # convert  a string to a string ready to be constantized
  # "Last orders".to_s_constant => "LastOrders"
  def to_humanize
    to_s.underscore.humanize
  end
end
