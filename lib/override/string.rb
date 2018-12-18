class String

  # convert  a string to a string ready to be constantized
  # "Last orders".to_s_constant => "LastOrders"
  def to_s_constant
    parameterize(separator: "_").camelize
  end

end