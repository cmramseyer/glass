module TrackingSupport
  def create_trackings(cut_track, drill_track, polish_track, temper_track, delivery_track)
    delivery_track.prev_tracking = temper_track

    temper_track.next_tracking = delivery_track
    temper_track.prev_tracking = polish_track

    polish_track.next_tracking = temper_track
    polish_track.prev_tracking = drill_track

    drill_track.next_tracking = polish_track
    drill_track.prev_tracking = cut_track

    cut_track.next_tracking = drill_track

    delivery_track.save
    temper_track.save
    polish_track.save
    drill_track.save
    cut_track.save
    { cut: cut_track, drill: drill_track, polish: polish_track, temper: temper_track, delivery: delivery_track }
  end
end
