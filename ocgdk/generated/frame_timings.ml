class type frame_timings_t = object
  method get_complete : unit -> bool
  method get_frame_counter : unit -> int64
  method get_frame_time : unit -> int64
  method get_predicted_presentation_time : unit -> int64
  method get_presentation_time : unit -> int64
  method get_refresh_interval : unit -> int64
  method ref : unit -> Raw.Frame_timings.t
  method as_frame_timings : Raw.Frame_timings.t
end

(* High-level class for FrameTimings *)
class frame_timings (obj : Raw.Frame_timings.t) : frame_timings_t =
  object (self)
    method get_complete : unit -> bool =
      fun () -> Raw.Frame_timings.get_complete obj

    method get_frame_counter : unit -> int64 =
      fun () -> Raw.Frame_timings.get_frame_counter obj

    method get_frame_time : unit -> int64 =
      fun () -> Raw.Frame_timings.get_frame_time obj

    method get_predicted_presentation_time : unit -> int64 =
      fun () -> Raw.Frame_timings.get_predicted_presentation_time obj

    method get_presentation_time : unit -> int64 =
      fun () -> Raw.Frame_timings.get_presentation_time obj

    method get_refresh_interval : unit -> int64 =
      fun () -> Raw.Frame_timings.get_refresh_interval obj

    method ref : unit -> Raw.Frame_timings.t =
      fun () -> Raw.Frame_timings.ref obj

    method as_frame_timings = obj
  end
