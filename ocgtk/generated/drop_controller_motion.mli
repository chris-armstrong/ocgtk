(** An event controller tracking the pointer during Drag-and-Drop operations.

    Its methods, signals and properties are on
    {!class-type-drop_controller_motion_t}. Its full description is under
    {!section-description}. Its constructors are under {!section-constructors}.
    The functions it is built on are in {!Ocgtk.Raw.Drop_controller_motion}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [DropControllerMotion].}

    Inherits from:
    {{!Ocgtk.Event_controller.class-type-event_controller_t}Ocgtk.Event_controller}

    An event controller tracking the pointer during Drag-and-Drop operations.

    It is modeled after [Gtk.EventControllerMotion] so if you have used that,
    this should feel really familiar.

    This controller is not able to accept drops, use [Gtk.DropTarget] for that
    purpose. *)
class type drop_controller_motion_t = object
  inherit Event_controller.event_controller_t

  (** {2:signals Signals} *)

  method on_enter :
    ?after:bool ->
    callback:(x:float -> y:float -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Signals that the pointer has entered the widget. *)

  method on_leave :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Signals that the pointer has left the widget. *)

  method on_motion :
    ?after:bool ->
    callback:(x:float -> y:float -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted when the pointer moves inside the widget. *)

  (** {2:methods Methods} *)

  method contains_pointer : unit -> bool
  (** Returns if a Drag-and-Drop operation is within the widget [self] or one of
      its children. *)

  method get_drop : unit -> Ocgdk.Drop.drop_t option
  (** Returns the [GdkDrop] of a current Drag-and-Drop operation over the widget
      of [self]. *)

  method is_pointer : unit -> bool
  (** Returns if a Drag-and-Drop operation is within the widget [self], not one
      of its children. *)

  (** {2:conversions Conversions} *)

  method as_drop_controller_motion : Raw.Drop_controller_motion.t
end

class drop_controller_motion :
  Raw.Drop_controller_motion.t ->
  drop_controller_motion_t
(** Wraps a raw handle of {!Ocgtk.Raw.Drop_controller_motion.t}. *)

(** {1:description Description}

    An event controller tracking the pointer during Drag-and-Drop operations.

    It is modeled after [Gtk.EventControllerMotion] so if you have used that,
    this should feel really familiar.

    This controller is not able to accept drops, use [Gtk.DropTarget] for that
    purpose. *)

(** {1:constructors Constructors} *)

val new_ : unit -> drop_controller_motion_t
(** Creates a new event controller that will handle pointer motion events during
    drag and drop. *)
