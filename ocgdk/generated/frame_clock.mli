(** Tells the application when to update and repaint a surface.

    Its methods, signals and properties are on {!class-type-frame_clock_t}. Its
    full description is under {!section-description}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgdk.Raw.Frame_clock}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [FrameClock].}

    Tells the application when to update and repaint a surface.

    This may be synced to the vertical refresh rate of the monitor, for example.
    Even when the frame clock uses a simple timer rather than a hardware-based
    vertical sync, the frame clock helps because it ensures everything paints at
    the same time (reducing the total number of frames).

    The frame clock can also automatically stop painting when it knows the
    frames will not be visible, or scale back animation framerates.

    [GdkFrameClock] is designed to be compatible with an OpenGL-based
    implementation or with mozRequestAnimationFrame in Firefox, for example.

    A frame clock is idle until someone requests a frame with
    {{!Ocgdk.Frame_clock.class-type-frame_clock_t.method-request_phase}[Gdk.FrameClock.request_phase]}.
    At some later point that makes sense for the synchronization being
    implemented, the clock will process a frame and emit signals for each phase
    that has been requested. (See the signals of the [GdkFrameClock] class for
    documentation of the phases. [GDK_FRAME_CLOCK_PHASE_UPDATE] and the
    {{!Ocgdk.Frame_clock.class-type-frame_clock_t.method-on_update}[Gdk.FrameClock::update]}
    signal are most interesting for application writers, and are used to update
    the animations, using the frame time given by
    {{!Ocgdk.Frame_clock.class-type-frame_clock_t.method-get_frame_time}[Gdk.FrameClock.get_frame_time]}.

    The frame time is reported in microseconds and generally in the same
    timescale as g_get_monotonic_time(), however, it is not the same as
    g_get_monotonic_time(). The frame time does not advance during the time a
    frame is being painted, and outside of a frame, an attempt is made so that
    all calls to
    {{!Ocgdk.Frame_clock.class-type-frame_clock_t.method-get_frame_time}[Gdk.FrameClock.get_frame_time]}
    that are called at a “similar” time get the same value. This means that if
    different animations are timed by looking at the difference in time between
    an initial value from
    {{!Ocgdk.Frame_clock.class-type-frame_clock_t.method-get_frame_time}[Gdk.FrameClock.get_frame_time]}
    and the value inside the
    {{!Ocgdk.Frame_clock.class-type-frame_clock_t.method-on_update}[Gdk.FrameClock::update]}
    signal of the clock, they will stay exactly synchronized. *)
class type frame_clock_t = object
  (** {2:signals Signals} *)

  method on_after_paint :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** This signal ends processing of the frame.

      Applications should generally not handle this signal. *)

  method on_before_paint :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Begins processing of the frame.

      Applications should generally not handle this signal. *)

  method on_flush_events :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Used to flush pending motion events that are being batched up and
      compressed together.

      Applications should not handle this signal. *)

  method on_layout :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Emitted as the second step of toolkit and application processing of the
      frame.

      Any work to update sizes and positions of application elements should be
      performed. GTK normally handles this internally. *)

  method on_paint :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Emitted as the third step of toolkit and application processing of the
      frame.

      The frame is repainted. GDK normally handles this internally and emits
      [Gdk.Surface::render] signals which are turned into GtkWidget::snapshot
      signals by GTK. *)

  method on_resume_events :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Emitted after processing of the frame is finished.

      This signal is handled internally by GTK to resume normal event
      processing. Applications should not handle this signal. *)

  method on_update :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Emitted as the first step of toolkit and application processing of the
      frame.

      Animations should be updated using [Gdk.FrameClock.get_frame_time].
      Applications can connect directly to this signal, or use
      gtk_widget_add_tick_callback() as a more convenient interface. *)

  (** {2:methods Methods} *)

  method begin_updating : unit -> unit
  (** Starts updates for an animation.

      Until a matching call to [Gdk.FrameClock.end_updating] is made, the frame
      clock will continually request a new frame with the
      [GDK_FRAME_CLOCK_PHASE_UPDATE] phase. This function may be called multiple
      times and frames will be requested until gdk_frame_clock_end_updating() is
      called the same number of times. *)

  method end_updating : unit -> unit
  (** Stops updates for an animation.

      See the documentation for [Gdk.FrameClock.begin_updating]. *)

  method get_current_timings : unit -> Raw.Frame_timings.t option
  (** Gets the frame timings for the current frame. *)

  method get_fps : unit -> float
  (** Calculates the current frames-per-second, based on the frame timings of
      [frame_clock]. *)

  method get_frame_counter : unit -> int64
  (** [GdkFrameClock] maintains a 64-bit counter that increments for each frame
      drawn. *)

  method get_frame_time : unit -> int64
  (** Gets the time that should currently be used for animations.

      Inside the processing of a frame, it’s the time used to compute the
      animation position of everything in a frame. Outside of a frame, it's the
      time of the conceptual “previous frame,” which may be either the actual
      previous frame time, or if that’s too old, an updated time. *)

  method get_history_start : unit -> int64
  (** Returns the frame counter for the oldest frame available in history.

      [GdkFrameClock] internally keeps a history of [GdkFrameTimings] objects
      for recent frames that can be retrieved with [Gdk.FrameClock.get_timings].
      The set of stored frames is the set from the counter values given by
      [Gdk.FrameClock.get_history_start] and [Gdk.FrameClock.get_frame_counter],
      inclusive. *)

  method get_timings : int64 -> Raw.Frame_timings.t option
  (** Retrieves a [GdkFrameTimings] object holding timing information for the
      current frame or a recent frame.

      The [GdkFrameTimings] object may not yet be complete: see
      [Gdk.FrameTimings.get_complete] and [Gdk.FrameClock.get_history_start]. *)

  method request_phase : Enums.frameclockphase -> unit
  (** Asks the frame clock to run a particular phase.

      The signal corresponding the requested phase will be emitted the next time
      the frame clock processes. Multiple calls to
      gdk_frame_clock_request_phase() will be combined together and only one
      frame processed. If you are displaying animated content and want to
      continually request the [GDK_FRAME_CLOCK_PHASE_UPDATE] phase for a period
      of time, you should use [Gdk.FrameClock.begin_updating] instead, since
      this allows GTK to adjust system parameters to get maximally smooth
      animations. *)

  (** {2:conversions Conversions} *)

  method as_frame_clock : Raw.Frame_clock.t
end

class frame_clock : Raw.Frame_clock.t -> frame_clock_t
(** Wraps a raw handle of {!Ocgdk.Raw.Frame_clock.t}. *)

(** {1:description Description}

    Tells the application when to update and repaint a surface.

    This may be synced to the vertical refresh rate of the monitor, for example.
    Even when the frame clock uses a simple timer rather than a hardware-based
    vertical sync, the frame clock helps because it ensures everything paints at
    the same time (reducing the total number of frames).

    The frame clock can also automatically stop painting when it knows the
    frames will not be visible, or scale back animation framerates.

    [GdkFrameClock] is designed to be compatible with an OpenGL-based
    implementation or with mozRequestAnimationFrame in Firefox, for example.

    A frame clock is idle until someone requests a frame with
    {{!Ocgdk.Frame_clock.class-type-frame_clock_t.method-request_phase}[Gdk.FrameClock.request_phase]}.
    At some later point that makes sense for the synchronization being
    implemented, the clock will process a frame and emit signals for each phase
    that has been requested. (See the signals of the [GdkFrameClock] class for
    documentation of the phases. [GDK_FRAME_CLOCK_PHASE_UPDATE] and the
    {{!Ocgdk.Frame_clock.class-type-frame_clock_t.method-on_update}[Gdk.FrameClock::update]}
    signal are most interesting for application writers, and are used to update
    the animations, using the frame time given by
    {{!Ocgdk.Frame_clock.class-type-frame_clock_t.method-get_frame_time}[Gdk.FrameClock.get_frame_time]}.

    The frame time is reported in microseconds and generally in the same
    timescale as g_get_monotonic_time(), however, it is not the same as
    g_get_monotonic_time(). The frame time does not advance during the time a
    frame is being painted, and outside of a frame, an attempt is made so that
    all calls to
    {{!Ocgdk.Frame_clock.class-type-frame_clock_t.method-get_frame_time}[Gdk.FrameClock.get_frame_time]}
    that are called at a “similar” time get the same value. This means that if
    different animations are timed by looking at the difference in time between
    an initial value from
    {{!Ocgdk.Frame_clock.class-type-frame_clock_t.method-get_frame_time}[Gdk.FrameClock.get_frame_time]}
    and the value inside the
    {{!Ocgdk.Frame_clock.class-type-frame_clock_t.method-on_update}[Gdk.FrameClock::update]}
    signal of the clock, they will stay exactly synchronized. *)

(** {1:constructors Constructors} *)

(** This is an abstract class that can't be instantiated directly. Refer to its
    subclasses for a concrete implementation. *)
