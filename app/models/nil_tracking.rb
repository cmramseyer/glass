class NilTracking

  def prev
    NilTracking.new
  end

  def next
    NilTracking.new
  end

  def valid_tracking?
    false
  end

  def done
    0
  end

end