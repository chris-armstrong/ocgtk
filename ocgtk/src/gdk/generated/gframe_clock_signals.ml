(* Signal handlers for FrameClock *)
class frame_clock_signals (obj : Frame_clock.t) = object
  (** This signal ends processing of the frame.

Applications should generally not handle this signal. *)
  method on_after_paint ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"after-paint" ~callback ~after:false

  (** Begins processing of the frame.

Applications should generally not handle this signal. *)
  method on_before_paint ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"before-paint" ~callback ~after:false

  (** Used to flush pending motion events that are being batched up and
compressed together.

Applications should not handle this signal. *)
  method on_flush_events ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"flush-events" ~callback ~after:false

  (** Emitted as the second step of toolkit and application processing
of the frame.

Any work to update sizes and positions of application elements
should be performed. GTK normally handles this internally. *)
  method on_layout ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"layout" ~callback ~after:false

  (** Emitted as the third step of toolkit and application processing
of the frame.

The frame is repainted. GDK normally handles this internally and
emits [signal@Gdk.Surface::render] signals which are turned into
[GtkWidget::snapshot](../gtk4/signal.Widget.snapshot.html) signals
by GTK. *)
  method on_paint ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"paint" ~callback ~after:false

  (** Emitted after processing of the frame is finished.

This signal is handled internally by GTK to resume normal
event processing. Applications should not handle this signal. *)
  method on_resume_events ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"resume-events" ~callback ~after:false

  (** Emitted as the first step of toolkit and application processing
of the frame.

Animations should be updated using [method@Gdk.FrameClock.get_frame_time].
Applications can connect directly to this signal, or use
[gtk_widget_add_tick_callback()](../gtk4/method.Widget.add_tick_callback.html)
as a more convenient interface. *)
  method on_update ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"update" ~callback ~after:false

end
