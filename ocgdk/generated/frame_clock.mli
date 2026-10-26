class type frame_clock_t = object
  method on_after_paint :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_before_paint :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_flush_events :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_layout :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_paint :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_resume_events :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_update :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method begin_updating : unit -> unit
  method end_updating : unit -> unit
  method get_current_timings : unit -> Raw.Frame_timings.t option
  method get_fps : unit -> float
  method get_frame_counter : unit -> int64
  method get_frame_time : unit -> int64
  method get_history_start : unit -> int64
  method get_timings : int64 -> Raw.Frame_timings.t option
  method request_phase : Enums.frameclockphase -> unit
  method as_frame_clock : Raw.Frame_clock.t
end

class frame_clock : Raw.Frame_clock.t -> frame_clock_t
