class type frame_clock_t = object
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

  method as_frame_clock : Raw.Frame_clock.t
end

(* High-level class for FrameClock *)
class frame_clock (obj : Raw.Frame_clock.t) : frame_clock_t =
  object (self)
    method on_after_paint ?(after = false) ~callback () =
      Raw.Frame_clock.on_after_paint ~after self#as_frame_clock ~callback

    method on_before_paint ?(after = false) ~callback () =
      Raw.Frame_clock.on_before_paint ~after self#as_frame_clock ~callback

    method on_flush_events ?(after = false) ~callback () =
      Raw.Frame_clock.on_flush_events ~after self#as_frame_clock ~callback

    method on_layout ?(after = false) ~callback () =
      Raw.Frame_clock.on_layout ~after self#as_frame_clock ~callback

    method on_paint ?(after = false) ~callback () =
      Raw.Frame_clock.on_paint ~after self#as_frame_clock ~callback

    method on_resume_events ?(after = false) ~callback () =
      Raw.Frame_clock.on_resume_events ~after self#as_frame_clock ~callback

    method on_update ?(after = false) ~callback () =
      Raw.Frame_clock.on_update ~after self#as_frame_clock ~callback

    method begin_updating : unit -> unit =
      fun () -> Raw.Frame_clock.begin_updating obj

    method end_updating : unit -> unit =
      fun () -> Raw.Frame_clock.end_updating obj

    method get_current_timings : unit -> Raw.Frame_timings.t option =
      fun () -> Raw.Frame_clock.get_current_timings obj

    method get_fps : unit -> float = fun () -> Raw.Frame_clock.get_fps obj

    method get_frame_counter : unit -> int64 =
      fun () -> Raw.Frame_clock.get_frame_counter obj

    method get_frame_time : unit -> int64 =
      fun () -> Raw.Frame_clock.get_frame_time obj

    method get_history_start : unit -> int64 =
      fun () -> Raw.Frame_clock.get_history_start obj

    method get_timings : int64 -> Raw.Frame_timings.t option =
      fun frame_counter -> Raw.Frame_clock.get_timings obj frame_counter

    method request_phase : Enums.frameclockphase -> unit =
      fun phase -> Raw.Frame_clock.request_phase obj phase

    method as_frame_clock = obj
  end
