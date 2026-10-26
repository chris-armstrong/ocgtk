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

class frame_timings : Raw.Frame_timings.t -> frame_timings_t
