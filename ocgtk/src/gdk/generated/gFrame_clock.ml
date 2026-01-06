(* Signal class defined in gframe_clock_signals.ml *)

(* High-level class for FrameClock *)
class frame_clock (obj : Frame_clock.t) = object (self)
  inherit Gframe_clock_signals.frame_clock_signals obj

  method begin_updating : unit -> unit =
    fun () ->
      (Frame_clock.begin_updating obj)

  method end_updating : unit -> unit =
    fun () ->
      (Frame_clock.end_updating obj)

  method get_current_timings : unit -> Frame_timings.t option =
    fun () ->
      (Frame_clock.get_current_timings obj)

  method get_fps : unit -> float =
    fun () ->
      (Frame_clock.get_fps obj)

  method request_phase : Gdk_enums.frameclockphase -> unit =
    fun phase ->
      (Frame_clock.request_phase obj phase)

    method as_frame_clock = obj
end

