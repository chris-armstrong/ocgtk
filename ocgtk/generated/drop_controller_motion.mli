(** An event controller tracking the pointer during Drag-and-Drop operations.

    It is modeled after [Gtk.EventControllerMotion] so if you have used that,
    this should feel really familiar.

    This controller is not able to accept drops, use [Gtk.DropTarget] for that
    purpose.

    Its methods, signals and properties are on
    {!class-type-drop_controller_motion_t}. The functions it is built on are in
    {!Ocgtk.Raw.Drop_controller_motion}. *)

(** The methods, signals and properties of a [GtkDropControllerMotion]. *)
class type drop_controller_motion_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .event_controller_t

  method on_enter :
    ?after:bool ->
    callback:(x:float -> y:float -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_leave :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_motion :
    ?after:bool ->
    callback:(x:float -> y:float -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method contains_pointer : unit -> bool
  method get_drop : unit -> Ocgdk.Drop.drop_t option
  method is_pointer : unit -> bool
  method as_drop_controller_motion : Raw.Drop_controller_motion.t
end

class drop_controller_motion :
  Raw.Drop_controller_motion.t ->
  drop_controller_motion_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Drop_controller_motion.t}. Apply it
    directly only to convert a handle obtained from layer 1: constructors, and
    methods that return a [GtkDropControllerMotion], give one already wrapped.
*)

val new_ : unit -> drop_controller_motion_t
