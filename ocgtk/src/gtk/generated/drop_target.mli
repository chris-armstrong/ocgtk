(* GENERATED CODE - DO NOT EDIT *)
(* DropTarget: DropTarget *)

type t = [ `drop_target | `event_controller | `object_ ] Gobject.obj
(** An event controller to receive Drag-and-Drop operations.

    The most basic way to use a [GtkDropTarget] to receive drops on a widget is
    to create it via [Gtk.DropTarget.new], passing in the [GType] of the data
    you want to receive and connect to the [Gtk.DropTarget::drop] signal to
    receive the data:

    {[
    static gboolean
    on_drop (GtkDropTarget *target,
             const GValue  *value,
             double         x,
             double         y,
             gpointer       data)
    {
      MyWidget *self = data;

      // Call the appropriate setter depending on the type of data
      // that we received
      if (G_VALUE_HOLDS (value, G_TYPE_FILE))
        my_widget_set_file (self, g_value_get_object (value));
      else if (G_VALUE_HOLDS (value, GDK_TYPE_PIXBUF))
        my_widget_set_pixbuf (self, g_value_get_object (value));
      else
        return FALSE;

      return TRUE;
    }

    static void
    my_widget_init (MyWidget *self)
    {
      GtkDropTarget *target =
        gtk_drop_target_new (G_TYPE_INVALID, GDK_ACTION_COPY);

      // This widget accepts two types of drop types: GFile objects
      // and GdkPixbuf objects
      gtk_drop_target_set_gtypes (target, (GType [2]) {
        G_TYPE_FILE,
        GDK_TYPE_PIXBUF,
      }, 2);

      g_signal_connect (target, “drop”, G_CALLBACK (on_drop), self);
      gtk_widget_add_controller (GTK_WIDGET (self), GTK_EVENT_CONTROLLER (target));
    }
    ]}

    [GtkDropTarget] supports more options, such as:

    - rejecting potential drops via the [Gtk.DropTarget::accept] signal and the
      [Gtk.DropTarget.reject] function to let other drop targets handle the drop
    - tracking an ongoing drag operation before the drop via the
      [Gtk.DropTarget::enter], [Gtk.DropTarget::motion] and
      [Gtk.DropTarget::leave] signals
    - configuring how to receive data by setting the [Gtk.DropTarget:preload]
      property and listening for its availability via the [Gtk.DropTarget:value]
      property

    However, [GtkDropTarget] is ultimately modeled in a synchronous way and only
    supports data transferred via [GType]. If you want full control over an
    ongoing drop, the [Gtk.DropTargetAsync] object gives you this ability.

    While a pointer is dragged over the drop target's widget and the drop has
    not been rejected, that widget will receive the [GTK_STATE_FLAG_DROP_ACTIVE]
    state, which can be used to style the widget.

    If you are not interested in receiving the drop, but just want to update UI
    state during a Drag-and-Drop operation (e.g. switching tabs), you can use
    [Gtk.DropControllerMotion]. *)

external new_ : Gobject.Type.t -> Ocgtk_gdk.Gdk.dragaction -> t
  = "ml_gtk_drop_target_new"
(** Create a new DropTarget *)

(* Methods *)

external set_preload : t -> bool -> unit = "ml_gtk_drop_target_set_preload"
(** Sets whether data should be preloaded on hover. *)

external set_gtypes : t -> Gobject.Type.t array option -> Gsize.t -> unit
  = "ml_gtk_drop_target_set_gtypes"
(** Sets the supported [GType]s for this drop target. *)

external set_actions : t -> Ocgtk_gdk.Gdk.dragaction -> unit
  = "ml_gtk_drop_target_set_actions"
(** Sets the actions that this drop target supports. *)

external reject : t -> unit = "ml_gtk_drop_target_reject"
(** Rejects the ongoing drop operation.

    If no drop operation is ongoing, i.e when [Gtk.DropTarget:current-drop] is
    [NULL], this function does nothing.

    This function should be used when delaying the decision on whether to accept
    a drag or not until after reading the data. *)

external get_value : t -> Gobject.Value.t option
  = "ml_gtk_drop_target_get_value"
(** Gets the current drop data, as a [GValue]. *)

external get_preload : t -> bool = "ml_gtk_drop_target_get_preload"
(** Gets whether data should be preloaded on hover. *)

external get_gtypes : t -> Gobject.Type.t array option * Gsize.t
  = "ml_gtk_drop_target_get_gtypes"
(** Gets the list of supported [GType]s that can be dropped on the target.

    If no types have been set, [NULL] will be returned. *)

external get_formats : t -> Ocgtk_gdk.Gdk.Wrappers.Content_formats.t option
  = "ml_gtk_drop_target_get_formats"
(** Gets the data formats that this drop target accepts.

    If the result is [NULL], all formats are expected to be supported. *)

external get_drop : t -> Ocgtk_gdk.Gdk.Wrappers.Drop.t option
  = "ml_gtk_drop_target_get_drop"
(** Gets the currently handled drop operation.

    If no drop operation is going on, [NULL] is returned. *)

external get_current_drop : t -> Ocgtk_gdk.Gdk.Wrappers.Drop.t option
  = "ml_gtk_drop_target_get_current_drop"
(** Gets the currently handled drop operation.

    If no drop operation is going on, [NULL] is returned. *)

external get_actions : t -> Ocgtk_gdk.Gdk.dragaction
  = "ml_gtk_drop_target_get_actions"
(** Gets the actions that this drop target supports. *)

(* Properties *)

val on_accept :
  ?after:bool ->
  t ->
  callback:(drop:Ocgtk_gdk.Gdk.Wrappers.Drop.t -> bool) ->
  Gobject.Signal.handler_id

val on_drop :
  ?after:bool ->
  t ->
  callback:(value:Gobject.Value.t -> x:float -> y:float -> bool) ->
  Gobject.Signal.handler_id

val on_enter :
  ?after:bool ->
  t ->
  callback:(x:float -> y:float -> Ocgtk_gdk.Gdk_enums.dragaction) ->
  Gobject.Signal.handler_id

val on_leave :
  ?after:bool -> t -> callback:(unit -> unit) -> Gobject.Signal.handler_id

val on_motion :
  ?after:bool ->
  t ->
  callback:(x:float -> y:float -> Ocgtk_gdk.Gdk_enums.dragaction) ->
  Gobject.Signal.handler_id
