class frame_clock : Frame_clock.t ->
  object
    inherit Gframe_clock_signals.frame_clock_signals
    method begin_updating : unit -> unit
    method end_updating : unit -> unit
    method get_current_timings : unit -> Frame_timings.t option
    method get_fps : unit -> float
    method request_phase : Gdk_enums.frameclockphase -> unit
    method as_frame_clock : Frame_clock.t
  end

