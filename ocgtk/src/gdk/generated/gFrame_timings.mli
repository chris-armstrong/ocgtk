class type frame_timings_t = object
    method get_complete : unit -> bool
    method ref : unit -> Frame_timings.t
    method unref : unit -> unit
    method as_frame_timings : Frame_timings.t
end

class frame_timings : Frame_timings.t -> frame_timings_t

