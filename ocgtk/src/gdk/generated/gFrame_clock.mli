class type frame_clock_t = object
  inherit Gframe_clock_signals.frame_clock_signals
  method begin_updating : unit -> unit
  method end_updating : unit -> unit
  method get_current_timings : unit -> Frame_timings.t option
  method get_fps : unit -> float
  method get_frame_counter : unit -> int64
  method get_frame_time : unit -> int64
  method get_history_start : unit -> int64
  method get_timings : int64 -> Frame_timings.t option
  method request_phase : Gdk_enums.frameclockphase -> unit
  method as_frame_clock : Frame_clock.t
end

class frame_clock : Frame_clock.t -> frame_clock_t
