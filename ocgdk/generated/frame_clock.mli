(** Tells the application when to update and repaint a surface.

    This may be synced to the vertical refresh rate of the monitor, for example.
    Even when the frame clock uses a simple timer rather than a hardware-based
    vertical sync, the frame clock helps because it ensures everything paints at
    the same time (reducing the total number of frames).

    The frame clock can also automatically stop painting when it knows the
    frames will not be visible, or scale back animation framerates.

    [GdkFrameClock] is designed to be compatible with an OpenGL-based
    implementation or with mozRequestAnimationFrame in Firefox, for example.

    A frame clock is idle until someone requests a frame with
    [Gdk.FrameClock.request_phase]. At some later point that makes sense for the
    synchronization being implemented, the clock will process a frame and emit
    signals for each phase that has been requested. (See the signals of the
    [GdkFrameClock] class for documentation of the phases.
    [GDK_FRAME_CLOCK_PHASE_UPDATE] and the [Gdk.FrameClock::update] signal are
    most interesting for application writers, and are used to update the
    animations, using the frame time given by [Gdk.FrameClock.get_frame_time].

    The frame time is reported in microseconds and generally in the same
    timescale as g_get_monotonic_time(), however, it is not the same as
    g_get_monotonic_time(). The frame time does not advance during the time a
    frame is being painted, and outside of a frame, an attempt is made so that
    all calls to [Gdk.FrameClock.get_frame_time] that are called at a “similar”
    time get the same value. This means that if different animations are timed
    by looking at the difference in time between an initial value from
    [Gdk.FrameClock.get_frame_time] and the value inside the
    [Gdk.FrameClock::update] signal of the clock, they will stay exactly
    synchronized.

    Its methods, signals and properties are on {!class-type-frame_clock_t}. The
    functions it is built on are in {!Ocgdk.Raw.Frame_clock}. *)

(** The methods, signals and properties of a [GdkFrameClock]. *)
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
(** Wraps a layer 1 handle, {!Ocgdk.Raw.Frame_clock.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [GdkFrameClock], give one already wrapped. *)
