(** A [GSimpleAction] is the obvious simple implementation of the [Gio.Action]
    interface. This is the easiest way to create an action for purposes of
    adding it to a [Gio.SimpleActionGroup].

    Its methods, signals and properties are on {!class-type-simple_action_t}.
    The functions it is built on are in {!Ocgio.Raw.Simple_action}. *)

(** The methods, signals and properties of a [GSimpleAction]. *)
class type simple_action_t = object
  inherit Action.action_t

  method on_activate :
    ?after:bool ->
    callback:(parameter:Gvariant.t -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_change_state :
    ?after:bool ->
    callback:(value:Gvariant.t -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method set_enabled : bool -> unit
  method set_state : Gvariant.t -> unit
  method set_state_hint : Gvariant.t option -> unit
  method name : string
  method parameter_type : Gvariant_type.t
  method state_type : Gvariant_type.t
  method as_simple_action : Raw.Simple_action.t
end

class simple_action : Raw.Simple_action.t -> simple_action_t
(** Wraps a layer 1 handle, {!Ocgio.Raw.Simple_action.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [GSimpleAction], give one already wrapped. *)

val new_ : string -> Gvariant_type.t option -> simple_action_t

val new_stateful :
  string -> Gvariant_type.t option -> Gvariant.t -> simple_action_t
