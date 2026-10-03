(* GENERATED CODE - DO NOT EDIT *)
(* DropTargetAsync: DropTargetAsync *)

type t = [ `drop_target_async | `event_controller | `object_ ] Gobject.obj
(** An event controller to receive Drag-and-Drop operations, asynchronously.

    It is the more complete but also more complex method of handling drop
    operations compared to [Gtk.DropTarget], and you should only use it if
    [GtkDropTarget] doesn't provide all the features you need.

    To use a [GtkDropTargetAsync] to receive drops on a widget, you create a
    [GtkDropTargetAsync] object, configure which data formats and actions you
    support, connect to its signals, and then attach it to the widget with
    [Gtk.Widget.add_controller].

    During a drag operation, the first signal that a [GtkDropTargetAsync] emits
    is [Gtk.DropTargetAsync::accept], which is meant to determine whether the
    target is a possible drop site for the ongoing drop. The default handler for
    the ::accept signal accepts the drop if it finds a compatible data format
    and an action that is supported on both sides.

    If it is, and the widget becomes a target, you will receive a
    [Gtk.DropTargetAsync::drag-enter] signal, followed by
    [Gtk.DropTargetAsync::drag-motion] signals as the pointer moves, optionally
    a [Gtk.DropTargetAsync::drop] signal when a drop happens, and finally a
    [Gtk.DropTargetAsync::drag-leave] signal when the pointer moves off the
    widget.

    The ::drag-enter and ::drag-motion handler return a [GdkDragAction] to
    update the status of the ongoing operation. The ::drop handler should decide
    if it ultimately accepts the drop and if it does, it should initiate the
    data transfer and finish the operation by calling [Gdk.Drop.finish].

    Between the ::drag-enter and ::drag-leave signals the widget is a current
    drop target, and will receive the [GTK_STATE_FLAG_DROP_ACTIVE] state, which
    can be used by themes to style the widget as a drop target. *)

external new_ :
  Ocgtk_gdk.Gdk.Wrappers.Content_formats.t option ->
  Ocgtk_gdk.Gdk.dragaction ->
  t = "ml_gtk_drop_target_async_new"
(** Create a new DropTargetAsync *)

(* Methods *)

external set_formats :
  t -> Ocgtk_gdk.Gdk.Wrappers.Content_formats.t option -> unit
  = "ml_gtk_drop_target_async_set_formats"
(** Sets the data formats that this drop target will accept. *)

external set_actions : t -> Ocgtk_gdk.Gdk.dragaction -> unit
  = "ml_gtk_drop_target_async_set_actions"
(** Sets the actions that this drop target supports. *)

external reject_drop : t -> Ocgtk_gdk.Gdk.Wrappers.Drop.t -> unit
  = "ml_gtk_drop_target_async_reject_drop"
(** Sets the [drop] as not accepted on this drag site.

    This function should be used when delaying the decision on whether to accept
    a drag or not until after reading the data. *)

external get_formats : t -> Ocgtk_gdk.Gdk.Wrappers.Content_formats.t option
  = "ml_gtk_drop_target_async_get_formats"
(** Gets the data formats that this drop target accepts.

    If the result is [NULL], all formats are expected to be supported. *)

external get_actions : t -> Ocgtk_gdk.Gdk.dragaction
  = "ml_gtk_drop_target_async_get_actions"
(** Gets the actions that this drop target supports. *)

(* Properties *)

val on_accept :
  ?after:bool ->
  t ->
  callback:(drop:Ocgtk_gdk.Gdk.Wrappers.Drop.t -> bool) ->
  Gobject.Signal.handler_id

val on_drag_enter :
  ?after:bool ->
  t ->
  callback:
    (drop:Ocgtk_gdk.Gdk.Wrappers.Drop.t ->
    x:float ->
    y:float ->
    Ocgtk_gdk.Gdk_enums.dragaction) ->
  Gobject.Signal.handler_id

val on_drag_leave :
  ?after:bool ->
  t ->
  callback:(drop:Ocgtk_gdk.Gdk.Wrappers.Drop.t -> unit) ->
  Gobject.Signal.handler_id

val on_drag_motion :
  ?after:bool ->
  t ->
  callback:
    (drop:Ocgtk_gdk.Gdk.Wrappers.Drop.t ->
    x:float ->
    y:float ->
    Ocgtk_gdk.Gdk_enums.dragaction) ->
  Gobject.Signal.handler_id

val on_drop :
  ?after:bool ->
  t ->
  callback:(drop:Ocgtk_gdk.Gdk.Wrappers.Drop.t -> x:float -> y:float -> bool) ->
  Gobject.Signal.handler_id
