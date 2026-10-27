(* GENERATED CODE - DO NOT EDIT *)
(* DropTargetAsync: DropTargetAsync *)

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
    can be used by themes to style the widget as a drop target.

    The class built on this module is in {!Ocgtk.Drop_target_async}. *)

type t = [ `drop_target_async | `event_controller | `object_ ] Gobject.obj

external gtype : unit -> Gobject.Type.t = "ml_gtk_drop_target_async_get_type"

external new_ :
  Ocgdk_raw.Content_formats.t option -> Ocgdk_enums.dragaction -> t
  = "ml_gtk_drop_target_async_new"
(** Creates a new [GtkDropTargetAsync] object. *)

(* Methods *)

external set_formats : t -> Ocgdk_raw.Content_formats.t option -> unit
  = "ml_gtk_drop_target_async_set_formats"
(** Sets the data formats that this drop target will accept. *)

external set_actions : t -> Ocgdk_enums.dragaction -> unit
  = "ml_gtk_drop_target_async_set_actions"
(** Sets the actions that this drop target supports. *)

external reject_drop : t -> Ocgdk_raw.Drop.t -> unit
  = "ml_gtk_drop_target_async_reject_drop"
(** Sets the [drop] as not accepted on this drag site.

    This function should be used when delaying the decision on whether to accept
    a drag or not until after reading the data. *)

external get_formats : t -> Ocgdk_raw.Content_formats.t option
  = "ml_gtk_drop_target_async_get_formats"
(** Gets the data formats that this drop target accepts.

    If the result is [NULL], all formats are expected to be supported. *)

external get_actions : t -> Ocgdk_enums.dragaction
  = "ml_gtk_drop_target_async_get_actions"
(** Gets the actions that this drop target supports. *)

(* Properties *)

val on_accept :
  ?after:bool ->
  t ->
  callback:(drop:Ocgdk_raw.Drop.t -> bool) ->
  Gobject.Signal.handler_id
(** Emitted on the drop site when a drop operation is about to begin.

    If the drop is not accepted, [FALSE] will be returned and the drop target
    will ignore the drop. If [TRUE] is returned, the drop is accepted for now
    but may be rejected later via a call to [Gtk.DropTargetAsync.reject_drop] or
    ultimately by returning [FALSE] from a [Gtk.DropTargetAsync::drop] handler.

    The default handler for this signal decides whether to accept the drop based
    on the formats provided by the [drop].

    If the decision whether the drop will be accepted or rejected needs further
    processing, such as inspecting the data, this function should return [TRUE]
    and proceed as is [drop] was accepted and if it decides to reject the drop
    later, it should call [Gtk.DropTargetAsync.reject_drop]. *)

val on_drag_enter :
  ?after:bool ->
  t ->
  callback:
    (drop:Ocgdk_raw.Drop.t -> x:float -> y:float -> Ocgdk_enums.dragaction) ->
  Gobject.Signal.handler_id
(** Emitted on the drop site when the pointer enters the widget.

    It can be used to set up custom highlighting. *)

val on_drag_leave :
  ?after:bool ->
  t ->
  callback:(drop:Ocgdk_raw.Drop.t -> unit) ->
  Gobject.Signal.handler_id
(** Emitted on the drop site when the pointer leaves the widget.

    Its main purpose it to undo things done in [GtkDropTargetAsync]::drag-enter.
*)

val on_drag_motion :
  ?after:bool ->
  t ->
  callback:
    (drop:Ocgdk_raw.Drop.t -> x:float -> y:float -> Ocgdk_enums.dragaction) ->
  Gobject.Signal.handler_id
(** Emitted while the pointer is moving over the drop target. *)

val on_drop :
  ?after:bool ->
  t ->
  callback:(drop:Ocgdk_raw.Drop.t -> x:float -> y:float -> bool) ->
  Gobject.Signal.handler_id
(** Emitted on the drop site when the user drops the data onto the widget.

    The signal handler must determine whether the pointer position is in a drop
    zone or not. If it is not in a drop zone, it returns [FALSE] and no further
    processing is necessary.

    Otherwise, the handler returns [TRUE]. In this case, this handler will
    accept the drop. The handler must ensure that [Gdk.Drop.finish] is called to
    let the source know that the drop is done. The call to [Gdk.Drop.finish]
    must only be done when all data has been received.

    To receive the data, use one of the read functions provided by [Gdk.Drop]
    such as [Gdk.Drop.read_async] or [Gdk.Drop.read_value_async]. *)
