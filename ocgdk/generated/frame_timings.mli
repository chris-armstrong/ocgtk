(** Holds timing information for a single frame of the application’s displays.

    To retrieve [GdkFrameTimings] objects, use [Gdk.FrameClock.get_timings] or
    [Gdk.FrameClock.get_current_timings]. The information in [GdkFrameTimings]
    is useful for precise synchronization of video with the event or audio
    streams, and for measuring quality metrics for the application’s display,
    such as latency and jitter.

    Its methods, signals and properties are on {!class-type-frame_timings_t}.
    The functions it is built on are in {!Ocgdk.Raw.Frame_timings}. *)

(** The methods, signals and properties of a [GdkFrameTimings]. *)
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
(** Wraps a layer 1 handle, {!Ocgdk.Raw.Frame_timings.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [GdkFrameTimings], give one already wrapped. *)
