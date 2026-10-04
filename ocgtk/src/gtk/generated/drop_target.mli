(* GENERATED CODE - DO NOT EDIT *)
(* DropTarget: DropTarget *)

[@@@ocaml.text
"An event controller to receive Drag-and-Drop operations.\n\n\
 The most basic way to use a [GtkDropTarget] to receive drops on a\n\
 widget is to create it via [Gtk.DropTarget.new], passing in the\n\
 [GType] of the data you want to receive and connect to the\n\
 [Gtk.DropTarget::drop] signal to receive the data:\n\n\
 {[\n\
 static gboolean\n\
 on_drop (GtkDropTarget *target,\n\
\         const GValue  *value,\n\
\         double         x,\n\
\         double         y,\n\
\         gpointer       data)\n\
 {\n\
\  MyWidget *self = data;\n\n\
\  // Call the appropriate setter depending on the type of data\n\
\  // that we received\n\
\  if (G_VALUE_HOLDS (value, G_TYPE_FILE))\n\
\    my_widget_set_file (self, g_value_get_object (value));\n\
\  else if (G_VALUE_HOLDS (value, GDK_TYPE_PIXBUF))\n\
\    my_widget_set_pixbuf (self, g_value_get_object (value));\n\
\  else\n\
\    return FALSE;\n\n\
\  return TRUE;\n\
 }\n\n\
 static void\n\
 my_widget_init (MyWidget *self)\n\
 {\n\
\  GtkDropTarget *target =\n\
\    gtk_drop_target_new (G_TYPE_INVALID, GDK_ACTION_COPY);\n\n\
\  // This widget accepts two types of drop types: GFile objects\n\
\  // and GdkPixbuf objects\n\
\  gtk_drop_target_set_gtypes (target, (GType [2]) {\n\
\    G_TYPE_FILE,\n\
\    GDK_TYPE_PIXBUF,\n\
\  }, 2);\n\n\
\  g_signal_connect (target, \"drop\", G_CALLBACK (on_drop), self);\n\
\  gtk_widget_add_controller (GTK_WIDGET (self), GTK_EVENT_CONTROLLER (target));\n\
 }\n\
 ]}\n\n\
 [GtkDropTarget] supports more options, such as:\n\n\
 - rejecting potential drops via the [Gtk.DropTarget::accept] signal\n\
 and the [Gtk.DropTarget.reject] function to let other drop\n\
 targets handle the drop\n\
 - tracking an ongoing drag operation before the drop via the\n\
 [Gtk.DropTarget::enter], [Gtk.DropTarget::motion] and\n\
 [Gtk.DropTarget::leave] signals\n\
 - configuring how to receive data by setting the\n\
 [Gtk.DropTarget:preload] property and listening for its\n\
 availability via the [Gtk.DropTarget:value] property\n\n\
 However, [GtkDropTarget] is ultimately modeled in a synchronous way\n\
 and only supports data transferred via [GType]. If you want full control\n\
 over an ongoing drop, the [Gtk.DropTargetAsync] object gives you\n\
 this ability.\n\n\
 While a pointer is dragged over the drop target's widget and the drop\n\
 has not been rejected, that widget will receive the\n\
 [GTK_STATE_FLAG_DROP_ACTIVE] state, which can be used to style the widget.\n\n\
 If you are not interested in receiving the drop, but just want to update\n\
 UI state during a Drag-and-Drop operation (e.g. switching tabs), you can\n\
 use [Gtk.DropControllerMotion]."]

type t = [ `drop_target | `event_controller | `object_ ] Gobject.obj

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
