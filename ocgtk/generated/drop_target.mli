(** An event controller to receive Drag-and-Drop operations.

    Its methods, signals and properties are on {!class-type-drop_target_t}. Its
    full description is under {!section-description}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgtk.Raw.Drop_target}. *)

(** {1:class Class} *)

class type drop_target_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .event_controller_t

  (** {2:signals Signals} *)

  method on_accept :
    ?after:bool ->
    callback:(drop:Ocgdk.Drop.drop_t -> bool) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted on the drop site when a drop operation is about to begin.

      If the drop is not accepted, [FALSE] will be returned and the drop target
      will ignore the drop. If [TRUE] is returned, the drop is accepted for now
      but may be rejected later via a call to [Gtk.DropTarget.reject] or
      ultimately by returning [FALSE] from a [Gtk.DropTarget::drop] handler.

      The default handler for this signal decides whether to accept the drop
      based on the formats provided by the [drop].

      If the decision whether the drop will be accepted or rejected depends on
      the data, this function should return [TRUE], the [Gtk.DropTarget:preload]
      property should be set and the value should be inspected via the
      ::notify:value signal, calling [Gtk.DropTarget.reject] if required. *)

  method on_drop :
    ?after:bool ->
    callback:(value:Gobject.Value.t -> x:float -> y:float -> bool) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted on the drop site when the user drops the data onto the widget.

      The signal handler must determine whether the pointer position is in a
      drop zone or not. If it is not in a drop zone, it returns [FALSE] and no
      further processing is necessary.

      Otherwise, the handler returns [TRUE]. In this case, this handler will
      accept the drop. The handler is responsible for using the given [value]
      and performing the drop operation. *)

  method on_enter :
    ?after:bool ->
    callback:(x:float -> y:float -> Ocgdk.Enums.dragaction) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted on the drop site when the pointer enters the widget.

      It can be used to set up custom highlighting. *)

  method on_leave :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Emitted on the drop site when the pointer leaves the widget.

      Its main purpose it to undo things done in [Gtk.DropTarget::enter]. *)

  method on_motion :
    ?after:bool ->
    callback:(x:float -> y:float -> Ocgdk.Enums.dragaction) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted while the pointer is moving over the drop target. *)

  (** {2:methods Methods} *)

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

  (** {2:conversions Conversions} *)

  method as_drop_target : Raw.Drop_target.t
end
  [@@ocaml.doc
    "{b The methods, signals and properties of a [DropTarget].}\n\n\
     An event controller to receive Drag-and-Drop operations.\n\n\
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
    \  gtk_widget_add_controller (GTK_WIDGET (self), GTK_EVENT_CONTROLLER \
     (target));\n\
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
     [GTK_STATE_FLAG_DROP_ACTIVE] state, which can be used to style the \
     widget.\n\n\
     If you are not interested in receiving the drop, but just want to update\n\
     UI state during a Drag-and-Drop operation (e.g. switching tabs), you can\n\
     use [Gtk.DropControllerMotion]."]

class drop_target : Raw.Drop_target.t -> drop_target_t
(** Wraps a raw handle of {!Ocgtk.Raw.Drop_target.t}. *)

[@@@ocaml.text
"{1:description Description}\n\n\
 An event controller to receive Drag-and-Drop operations.\n\n\
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

(** {1:constructors Constructors} *)

val new_ : Gobject.Type.t -> Ocgdk.Enums.dragaction -> drop_target_t
(** Creates a new [GtkDropTarget] object.

    If the drop target should support more than 1 type, pass [G_TYPE_INVALID]
    for [type] and then call [Gtk.DropTarget.set_gtypes]. *)
