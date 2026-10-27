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

    Its methods, signals and properties are on
    {!class-type-drop_target_async_t}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgtk.Raw.Drop_target_async}. *)

(** The methods, signals and properties of a [GtkDropTargetAsync]. *)
class type drop_target_async_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .event_controller_t

  method on_accept :
    ?after:bool ->
    callback:(drop:Ocgdk.Drop.drop_t -> bool) ->
    unit ->
    Gobject.Signal.handler_id

  method on_drag_enter :
    ?after:bool ->
    callback:
      (drop:Ocgdk.Drop.drop_t -> x:float -> y:float -> Ocgdk.Enums.dragaction) ->
    unit ->
    Gobject.Signal.handler_id

  method on_drag_leave :
    ?after:bool ->
    callback:(drop:Ocgdk.Drop.drop_t -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_drag_motion :
    ?after:bool ->
    callback:
      (drop:Ocgdk.Drop.drop_t -> x:float -> y:float -> Ocgdk.Enums.dragaction) ->
    unit ->
    Gobject.Signal.handler_id

  method on_drop :
    ?after:bool ->
    callback:(drop:Ocgdk.Drop.drop_t -> x:float -> y:float -> bool) ->
    unit ->
    Gobject.Signal.handler_id

  method get_actions : unit -> Ocgdk.Enums.dragaction
  (** Gets the actions that this drop target supports. *)

  method get_formats : unit -> Ocgdk.Content_formats.content_formats_t option
  (** Gets the data formats that this drop target accepts.

      If the result is [NULL], all formats are expected to be supported. *)

  method reject_drop : Ocgdk.Drop.drop_t -> unit
  (** Sets the [drop] as not accepted on this drag site.

      This function should be used when delaying the decision on whether to
      accept a drag or not until after reading the data. *)

  method set_actions : Ocgdk.Enums.dragaction -> unit
  (** Sets the actions that this drop target supports. *)

  method set_formats : Ocgdk.Content_formats.content_formats_t option -> unit
  (** Sets the data formats that this drop target will accept. *)

  method as_drop_target_async : Raw.Drop_target_async.t
end

class drop_target_async : Raw.Drop_target_async.t -> drop_target_async_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Drop_target_async.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [GtkDropTargetAsync], give one already wrapped. *)

(** {2:constructors Constructors} *)

val new_ :
  Ocgdk.Content_formats.content_formats_t option ->
  Ocgdk.Enums.dragaction ->
  drop_target_async_t
(** Creates a new [GtkDropTargetAsync] object. *)
