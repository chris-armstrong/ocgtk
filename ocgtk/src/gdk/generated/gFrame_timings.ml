(* High-level class for FrameTimings *)
class frame_timings (obj : Frame_timings.t) = object (self)

  method get_complete : unit -> bool =
    fun () ->
      (Frame_timings.get_complete obj)

  method ref : unit -> Frame_timings.t =
    fun () ->
      (Frame_timings.ref obj)

  method unref : unit -> unit =
    fun () ->
      (Frame_timings.unref obj)

    method as_frame_timings = obj
end

