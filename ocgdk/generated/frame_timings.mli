(** Holds timing information for a single frame of the application’s displays.

    Its methods, signals and properties are on {!class-type-frame_timings_t}.
    Its full description is under {!section-description}. The functions it is
    built on are in {!Ocgdk.Raw.Frame_timings}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [FrameTimings].}

    Holds timing information for a single frame of the application’s displays.

    To retrieve [GdkFrameTimings] objects, use [Gdk.FrameClock.get_timings] or
    [Gdk.FrameClock.get_current_timings]. The information in [GdkFrameTimings]
    is useful for precise synchronization of video with the event or audio
    streams, and for measuring quality metrics for the application’s display,
    such as latency and jitter. *)
class type frame_timings_t = object
  (** {2:methods Methods} *)

  method get_complete : unit -> bool
  (** Returns whether [timings] are complete.

      The timing information in a [GdkFrameTimings] is filled in incrementally
      as the frame as drawn and passed off to the window system for processing
      and display to the user. The accessor functions for [GdkFrameTimings] can
      return 0 to indicate an unavailable value for two reasons: either because
      the information is not yet available, or because it isn't available at
      all.

      Once this function returns [TRUE] for a frame, you can be certain that no
      further values will become available and be stored in the
      [GdkFrameTimings]. *)

  method get_frame_counter : unit -> int64
  (** Gets the frame counter value of the [GdkFrameClock] when this frame was
      drawn. *)

  method get_frame_time : unit -> int64
  (** Returns the frame time for the frame.

      This is the time value that is typically used to time animations for the
      frame. See [Gdk.FrameClock.get_frame_time]. *)

  method get_predicted_presentation_time : unit -> int64
  (** Gets the predicted time at which this frame will be displayed.

      Although no predicted time may be available, if one is available, it will
      be available while the frame is being generated, in contrast to
      [Gdk.FrameTimings.get_presentation_time], which is only available after
      the frame has been presented.

      In general, if you are simply animating, you should use
      [Gdk.FrameClock.get_frame_time] rather than this function, but this
      function is useful for applications that want exact control over latency.
      For example, a movie player may want this information for Audio/Video
      synchronization. *)

  method get_presentation_time : unit -> int64
  (** Reurns the presentation time.

      This is the time at which the frame became visible to the user. *)

  method get_refresh_interval : unit -> int64
  (** Gets the natural interval between presentation times for the display that
      this frame was displayed on.

      Frame presentation usually happens during the “vertical blanking
      interval”. *)

  method ref : unit -> Raw.Frame_timings.t
  (** Increases the reference count of [timings]. *)

  (** {2:conversions Conversions} *)

  method as_frame_timings : Raw.Frame_timings.t
end

class frame_timings : Raw.Frame_timings.t -> frame_timings_t
(** Wraps a raw handle of {!Ocgdk.Raw.Frame_timings.t}. *)

(** {1:description Description}

    Holds timing information for a single frame of the application’s displays.

    To retrieve [GdkFrameTimings] objects, use [Gdk.FrameClock.get_timings] or
    [Gdk.FrameClock.get_current_timings]. The information in [GdkFrameTimings]
    is useful for precise synchronization of video with the event or audio
    streams, and for measuring quality metrics for the application’s display,
    such as latency and jitter. *)
