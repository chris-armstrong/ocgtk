(* GENERATED CODE - DO NOT EDIT *)
(* SimpleAction: SimpleAction *)

(** A [GSimpleAction] is the obvious simple implementation of the
    {{!Ocgio.Raw.Action}[Gio.Action]} interface. This is the easiest way to
    create an action for purposes of adding it to a
    {{!Ocgio.Raw.Simple_action_group}[Gio.SimpleActionGroup]}.

    The class built on this module is in {!Ocgio.Simple_action}. *)

type t = [ `simple_action | `object_ ] Gobject.obj

external gtype : unit -> Gobject.Type.t = "ml_gio_simple_action_get_type"

external new_ : string -> Gvariant_type.t option -> t = "ml_g_simple_action_new"
(** Creates a new action.

    The created action is stateless. See g_simple_action_new_stateful() to
    create an action that has state. *)

external new_stateful : string -> Gvariant_type.t option -> Gvariant.t -> t
  = "ml_g_simple_action_new_stateful"
(** Creates a new stateful action.

    All future state values must have the same [GVariantType] as the initial
    [state].

    If the [state] [GVariant] is floating, it is consumed. *)

(* Methods *)

external set_state_hint : t -> Gvariant.t option -> unit
  = "ml_g_simple_action_set_state_hint"
(** Sets the state hint for the action.

    See g_action_get_state_hint() for more information about action state hints.
*)

external set_state : t -> Gvariant.t -> unit = "ml_g_simple_action_set_state"
(** Sets the state of the action.

    This directly updates the 'state' property to the given value.

    This should only be called by the implementor of the action. Users of the
    action should not attempt to directly modify the 'state' property. Instead,
    they should call g_action_change_state() to request the change.

    If the [value] GVariant is floating, it is consumed. *)

external set_enabled : t -> bool -> unit = "ml_g_simple_action_set_enabled"
(** Sets the action as enabled or not.

    An action must be enabled in order to be activated or in order to have its
    state changed from outside callers.

    This should only be called by the implementor of the action. Users of the
    action should not attempt to modify its enabled flag. *)

(* Properties *)

external get_name : t -> string = "ml_g_simple_action_get_name"
(** The name of the action. This is mostly meaningful for identifying the action
    once it has been added to a [GSimpleActionGroup]. *)

external get_parameter_type : t -> Gvariant_type.t
  = "ml_g_simple_action_get_parameter_type"
(** The type of the parameter that must be given when activating the action. *)

external get_state_type : t -> Gvariant_type.t
  = "ml_g_simple_action_get_state_type"
(** The [GVariantType] of the state that the action has, or [None] if the action
    is stateless. *)

let on_activate ?after obj ~callback =
  let closure =
    Gobject.Closure.create (fun argv ->
        let parameter =
          let v = Gobject.Closure.nth argv ~pos:1 in
          Gobject.Value.get_variant v
        in
        callback ~parameter)
  in
  Gobject.Signal.connect obj ~name:"activate" ~callback:closure
    ~after:(Option.value after ~default:false)

let on_change_state ?after obj ~callback =
  let closure =
    Gobject.Closure.create (fun argv ->
        let value =
          let v = Gobject.Closure.nth argv ~pos:1 in
          Gobject.Value.get_variant v
        in
        callback ~value)
  in
  Gobject.Signal.connect obj ~name:"change-state" ~callback:closure
    ~after:(Option.value after ~default:false)
