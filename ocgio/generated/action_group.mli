(** [GActionGroup] represents a group of actions.

    Actions can be used to expose functionality in a structured way, either from
    one part of a program to another, or to the outside world. Action groups are
    often used together with a [Gio.MenuModel] that provides additional
    representation data for displaying the actions to the user, e.g. in a menu.

    The main way to interact with the actions in a [GActionGroup] is to activate
    them with [Gio.ActionGroup.activate_action]. Activating an action may
    require a [GLib.Variant] parameter. The required type of the parameter can
    be inquired with [Gio.ActionGroup.get_action_parameter_type]. Actions may be
    disabled, see [Gio.ActionGroup.get_action_enabled]. Activating a disabled
    action has no effect.

    Actions may optionally have a state in the form of a [GLib.Variant]. The
    current state of an action can be inquired with
    [Gio.ActionGroup.get_action_state]. Activating a stateful action may change
    its state, but it is also possible to set the state by calling
    [Gio.ActionGroup.change_action_state].

    As typical example, consider a text editing application which has an option
    to change the current font to ‘bold’. A good way to represent this would be
    a stateful action, with a boolean state. Activating the action would toggle
    the state.

    Each action in the group has a unique name (which is a string). All method
    calls, except [Gio.ActionGroup.list_actions] take the name of an action as
    an argument.

    The [GActionGroup] API is meant to be the ‘public’ API to the action group.
    The calls here are exactly the interaction that ‘external forces’ (eg: UI,
    incoming D-Bus messages, etc.) are supposed to have with actions. ‘Internal’
    APIs (ie: ones meant only to be accessed by the action group implementation)
    are found on subclasses. This is why you will find – for example –
    [Gio.ActionGroup.get_action_enabled] but not an equivalent
    [set_action_enabled()] method.

    Signals are emitted on the action group in response to state changes on
    individual actions.

    Implementations of [GActionGroup] should provide implementations for the
    virtual functions [Gio.ActionGroup.list_actions] and
    [Gio.ActionGroup.query_action]. The other virtual functions should not be
    implemented — their ‘wrappers’ are actually implemented with calls to
    [Gio.ActionGroup.query_action].

    Its methods, signals and properties are on {!class-type-action_group_t}. The
    functions it is built on are in {!Ocgio.Raw.Action_group}. *)

(** The methods, signals and properties of a [GActionGroup]. *)
class type action_group_t = object
  method on_action_added :
    ?after:bool ->
    callback:(action_name:string -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_action_enabled_changed :
    ?after:bool ->
    callback:(action_name:string -> enabled:bool -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_action_removed :
    ?after:bool ->
    callback:(action_name:string -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_action_state_changed :
    ?after:bool ->
    callback:(action_name:string -> value:Gvariant.t -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method action_added : string -> unit
  method action_enabled_changed : string -> bool -> unit
  method action_removed : string -> unit
  method action_state_changed : string -> Gvariant.t -> unit
  method activate_action : string -> Gvariant.t option -> unit
  method change_action_state : string -> Gvariant.t -> unit
  method get_action_enabled : string -> bool
  method get_action_parameter_type : string -> Gvariant_type.t option
  method get_action_state : string -> Gvariant.t option
  method get_action_state_hint : string -> Gvariant.t option
  method get_action_state_type : string -> Gvariant_type.t option
  method has_action : string -> bool
  method list_actions : unit -> string array
  method as_action_group : Raw.Action_group.t
end

class action_group : Raw.Action_group.t -> action_group_t
(** Wraps a layer 1 handle, {!Ocgio.Raw.Action_group.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [GActionGroup], give one already wrapped. *)
