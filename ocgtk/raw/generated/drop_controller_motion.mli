(* GENERATED CODE - DO NOT EDIT *)
(* DropControllerMotion: DropControllerMotion *)

(** An event controller tracking the pointer during Drag-and-Drop operations.

    It is modeled after
    {{!Ocgtk.Raw.Event_controller_motion}[Gtk.EventControllerMotion]} so if you
    have used that, this should feel really familiar.

    This controller is not able to accept drops, use
    {{!Ocgtk.Raw.Drop_target}[Gtk.DropTarget]} for that purpose.

    The class built on this module is in {!Ocgtk.Drop_controller_motion}. *)

type t = [ `drop_controller_motion | `event_controller | `object_ ] Gobject.obj

external gtype : unit -> Gobject.Type.t
  = "ml_gtk_drop_controller_motion_get_type"

external new_ : unit -> t = "ml_gtk_drop_controller_motion_new"
(** Creates a new event controller that will handle pointer motion events during
    drag and drop. *)

(* Methods *)

external is_pointer : t -> bool = "ml_gtk_drop_controller_motion_is_pointer"
(** Returns if a Drag-and-Drop operation is within the widget [self], not one of
    its children. *)

external get_drop : t -> Ocgdk_raw.Drop.t option
  = "ml_gtk_drop_controller_motion_get_drop"
(** Returns the [GdkDrop] of a current Drag-and-Drop operation over the widget
    of [self]. *)

external contains_pointer : t -> bool
  = "ml_gtk_drop_controller_motion_contains_pointer"
(** Returns if a Drag-and-Drop operation is within the widget [self] or one of
    its children. *)

(* Properties *)

val on_enter :
  ?after:bool ->
  t ->
  callback:(x:float -> y:float -> unit) ->
  Gobject.Signal.handler_id
(** Signals that the pointer has entered the widget. *)

val on_leave :
  ?after:bool -> t -> callback:(unit -> unit) -> Gobject.Signal.handler_id
(** Signals that the pointer has left the widget. *)

val on_motion :
  ?after:bool ->
  t ->
  callback:(x:float -> y:float -> unit) ->
  Gobject.Signal.handler_id
(** Emitted when the pointer moves inside the widget. *)
