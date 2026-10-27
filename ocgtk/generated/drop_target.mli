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
 use [Gtk.DropControllerMotion].\n\n\
 Its methods, signals and properties are on {!class-type-drop_target_t}. The \
 functions it is built on are in {!Ocgtk.Raw.Drop_target}."]

(** The methods, signals and properties of a [GtkDropTarget]. *)
class type drop_target_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .event_controller_t

  method on_accept :
    ?after:bool ->
    callback:(drop:Ocgdk.Drop.drop_t -> bool) ->
    unit ->
    Gobject.Signal.handler_id

  method on_drop :
    ?after:bool ->
    callback:(value:Gobject.Value.t -> x:float -> y:float -> bool) ->
    unit ->
    Gobject.Signal.handler_id

  method on_enter :
    ?after:bool ->
    callback:(x:float -> y:float -> Ocgdk.Enums.dragaction) ->
    unit ->
    Gobject.Signal.handler_id

  method on_leave :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_motion :
    ?after:bool ->
    callback:(x:float -> y:float -> Ocgdk.Enums.dragaction) ->
    unit ->
    Gobject.Signal.handler_id

  method get_actions : unit -> Ocgdk.Enums.dragaction
  (** Gets the actions that this drop target supports. *)

  method get_current_drop : unit -> Ocgdk.Drop.drop_t option
  (** Gets the currently handled drop operation.

      If no drop operation is going on, [NULL] is returned. *)

  method get_drop : unit -> Ocgdk.Drop.drop_t option
  (** Gets the currently handled drop operation.

      If no drop operation is going on, [NULL] is returned. *)

  method get_formats : unit -> Ocgdk.Content_formats.content_formats_t option
  (** Gets the data formats that this drop target accepts.

      If the result is [NULL], all formats are expected to be supported. *)

  method get_preload : unit -> bool
  (** Gets whether data should be preloaded on hover. *)

  method get_value : unit -> Gobject.Value.t option
  (** Gets the current drop data, as a [GValue]. *)

  method reject : unit -> unit
  (** Rejects the ongoing drop operation.

      If no drop operation is ongoing, i.e when [Gtk.DropTarget:current-drop] is
      [NULL], this function does nothing.

      This function should be used when delaying the decision on whether to
      accept a drag or not until after reading the data. *)

  method set_actions : Ocgdk.Enums.dragaction -> unit
  (** Sets the actions that this drop target supports. *)

  method set_gtypes : Gobject.Type.t array option -> Gsize.t -> unit
  (** Sets the supported [GType]s for this drop target. *)

  method set_preload : bool -> unit
  (** Sets whether data should be preloaded on hover. *)

  method as_drop_target : Raw.Drop_target.t
end

class drop_target : Raw.Drop_target.t -> drop_target_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Drop_target.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkDropTarget], give one already wrapped. *)

val new_ : Gobject.Type.t -> Ocgdk.Enums.dragaction -> drop_target_t
