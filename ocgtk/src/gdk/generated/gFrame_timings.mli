class frame_timings : Frame_timings.t ->
  object
    method get_complete : unit -> bool
    method ref : unit -> Frame_timings.t
    method unref : unit -> unit
    method as_frame_timings : Frame_timings.t
  end

