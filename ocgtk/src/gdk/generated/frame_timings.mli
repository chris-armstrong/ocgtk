(* GENERATED CODE - DO NOT EDIT *)
(* FrameTimings: FrameTimings *)

(** A `GdkFrameTimings` object holds timing information for a single frame
of the application’s displays.

To retrieve `GdkFrameTimings` objects, use [method@Gdk.FrameClock.get_timings]
or [method@Gdk.FrameClock.get_current_timings]. The information in
`GdkFrameTimings` is useful for precise synchronization of video with
the event or audio streams, and for measuring quality metrics for the
application’s display, such as latency and jitter. *)
type t = [`frame_timings] Gobject.obj

(* Methods *)
(** Decreases the reference count of @timings.

If @timings is no longer referenced, it will be freed. *)
external unref : t -> unit = "ml_gdk_frame_timings_unref"

(** Increases the reference count of @timings. *)
external ref : t -> t = "ml_gdk_frame_timings_ref"

(** Returns whether @timings are complete.

The timing information in a `GdkFrameTimings` is filled in
incrementally as the frame as drawn and passed off to the
window system for processing and display to the user. The
accessor functions for `GdkFrameTimings` can return 0 to
indicate an unavailable value for two reasons: either because
the information is not yet available, or because it isn't
available at all.

Once this function returns %TRUE for a frame, you can be
certain that no further values will become available and be
stored in the `GdkFrameTimings`. *)
external get_complete : t -> bool = "ml_gdk_frame_timings_get_complete"

