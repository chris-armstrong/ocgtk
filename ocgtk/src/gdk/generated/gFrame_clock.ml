class type frame_clock_t = object
    method on_after_paint : ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
    method on_before_paint : ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
    method on_flush_events : ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
    method on_layout : ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
    method on_paint : ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
    method on_resume_events : ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
    method on_update : ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
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

(* High-level class for FrameClock *)
class frame_clock (obj : Frame_clock.t) : frame_clock_t = object (self)
  method on_after_paint ?(after = false) ~callback () =
    Frame_clock.on_after_paint ~after self#as_frame_clock ~callback

  method on_before_paint ?(after = false) ~callback () =
    Frame_clock.on_before_paint ~after self#as_frame_clock ~callback

  method on_flush_events ?(after = false) ~callback () =
    Frame_clock.on_flush_events ~after self#as_frame_clock ~callback

  method on_layout ?(after = false) ~callback () =
    Frame_clock.on_layout ~after self#as_frame_clock ~callback

  method on_paint ?(after = false) ~callback () =
    Frame_clock.on_paint ~after self#as_frame_clock ~callback

  method on_resume_events ?(after = false) ~callback () =
    Frame_clock.on_resume_events ~after self#as_frame_clock ~callback

  method on_update ?(after = false) ~callback () =
    Frame_clock.on_update ~after self#as_frame_clock ~callback


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

  method get_frame_counter : unit -> int64 =
    fun () ->
      (Frame_clock.get_frame_counter obj)

  method get_frame_time : unit -> int64 =
    fun () ->
      (Frame_clock.get_frame_time obj)

  method get_history_start : unit -> int64 =
    fun () ->
      (Frame_clock.get_history_start obj)

  method get_timings : int64 -> Frame_timings.t option =
    fun frame_counter ->
      (Frame_clock.get_timings obj frame_counter)

  method request_phase : Gdk_enums.frameclockphase -> unit =
    fun phase ->
      (Frame_clock.request_phase obj phase)

    method as_frame_clock = obj
end

