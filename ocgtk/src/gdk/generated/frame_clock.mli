(* GENERATED CODE - DO NOT EDIT *)
(* FrameClock: FrameClock *)

type t = [`frame_clock | `object_] Gobject.obj

(* Methods *)
(** Asks the frame clock to run a particular phase.

The signal corresponding the requested phase will be emitted the next
time the frame clock processes. Multiple calls to
gdk_frame_clock_request_phase() will be combined together
and only one frame processed. If you are displaying animated
content and want to continually request the
%GDK_FRAME_CLOCK_PHASE_UPDATE phase for a period of time,
you should use [method@Gdk.FrameClock.begin_updating] instead,
since this allows GTK to adjust system parameters to get maximally
smooth animations. *)
external request_phase : t -> Gdk_enums.frameclockphase -> unit = "ml_gdk_frame_clock_request_phase"

(** Calculates the current frames-per-second, based on the
frame timings of @frame_clock. *)
external get_fps : t -> float = "ml_gdk_frame_clock_get_fps"

(** Gets the frame timings for the current frame. *)
external get_current_timings : t -> Frame_timings.t option = "ml_gdk_frame_clock_get_current_timings"

(** Stops updates for an animation.

See the documentation for [method@Gdk.FrameClock.begin_updating]. *)
external end_updating : t -> unit = "ml_gdk_frame_clock_end_updating"

(** Starts updates for an animation.

Until a matching call to [method@Gdk.FrameClock.end_updating] is made,
the frame clock will continually request a new frame with the
%GDK_FRAME_CLOCK_PHASE_UPDATE phase. This function may be called multiple
times and frames will be requested until gdk_frame_clock_end_updating()
is called the same number of times. *)
external begin_updating : t -> unit = "ml_gdk_frame_clock_begin_updating"

