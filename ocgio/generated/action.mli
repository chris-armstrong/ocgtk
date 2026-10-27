(** [GAction] represents a single named action.

    The main interface to an action is that it can be activated with
    [Gio.Action.activate]. This results in the 'activate' signal being emitted.
    An activation has a [GVariant] parameter (which may be [NULL]). The correct
    type for the parameter is determined by a static parameter type (which is
    given at construction time).

    An action may optionally have a state, in which case the state may be set
    with [Gio.Action.change_state]. This call takes a [GLib.Variant]. The
    correct type for the state is determined by a static state type (which is
    given at construction time).

    The state may have a hint associated with it, specifying its valid range.

    [GAction] is merely the interface to the concept of an action, as described
    above. Various implementations of actions exist, including
    [Gio.SimpleAction].

    In all cases, the implementing class is responsible for storing the name of
    the action, the parameter type, the enabled state, the optional state type
    and the state and emitting the appropriate signals when these change. The
    implementor is responsible for filtering calls to [Gio.Action.activate] and
    [Gio.Action.change_state] for type safety and for the state being enabled.

    Probably the only useful thing to do with a [GAction] is to put it inside of
    a [Gio.SimpleActionGroup].

    Its methods, signals and properties are on {!class-type-action_t}. The
    functions it is built on are in {!Ocgio.Raw.Action}. *)

(** The methods, signals and properties of a [GAction]. *)
class type action_t = object
  method activate : Gvariant.t option -> unit
  method change_state : Gvariant.t -> unit
  method get_enabled : unit -> bool
  method get_name : unit -> string
  method get_parameter_type : unit -> Gvariant_type.t option
  method get_state : unit -> Gvariant.t option
  method get_state_hint : unit -> Gvariant.t option
  method get_state_type : unit -> Gvariant_type.t option
  method as_action : Raw.Action.t
end

class action : Raw.Action.t -> action_t
(** Wraps a layer 1 handle, {!Ocgio.Raw.Action.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [GAction], give one already wrapped. *)
