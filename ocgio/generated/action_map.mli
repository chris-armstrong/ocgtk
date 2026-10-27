[@@@ocaml.text
"[GActionMap] is an interface for action containers.\n\n\
 The [GActionMap] interface is implemented by [Gio.ActionGroup]\n\
 implementations that operate by containing a number of named\n\
 [Gio.Action] instances, such as [Gio.SimpleActionGroup].\n\n\
 One useful application of this interface is to map the\n\
 names of actions from various action groups to unique,\n\
 prefixed names (e.g. by prepending \"app.\" or \"win.\").\n\
 This is the motivation for the ‘Map’ part of the interface\n\
 name.\n\n\
 Its methods, signals and properties are on {!class-type-action_map_t}. The \
 functions it is built on are in {!Ocgio.Raw.Action_map}."]

(** The methods, signals and properties of a [GActionMap]. *)
class type action_map_t = object
  method add_action : Action.action_t -> unit
  method lookup_action : string -> Action.action_t option
  method remove_action : string -> unit
  method remove_action_entries : Raw.Action_entry.t array -> int -> unit
  method as_action_map : Raw.Action_map.t
end

class action_map : Raw.Action_map.t -> action_map_t
(** Wraps a layer 1 handle, {!Ocgio.Raw.Action_map.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [GActionMap], give one already wrapped. *)
