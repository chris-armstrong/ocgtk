(* GENERATED CODE - DO NOT EDIT *)
(* ActionEntry: ActionEntry *)

type t = [ `action_entry ] Gobject.obj
(** This struct defines a single action.  It is for use with
g_action_map_add_action_entries().

The order of the items in the structure are intended to reflect
frequency of use.  It is permissible to use an incomplete initialiser
in order to leave some of the later values as %NULL.  All values
after @name are optional.  Additional optional fields may be added in
the future.

See g_action_map_add_action_entries() for an example. *)

(* Methods *)

(* Record field accessors *)

(* Getters *)
external get_name : t -> string = "ml_g_action_entry_get_name"

external get_parameter_type : t -> string
  = "ml_g_action_entry_get_parameter_type"

external get_state : t -> string = "ml_g_action_entry_get_state"

(* Setters *)
external set_name : t -> string -> unit = "ml_g_action_entry_set_name"

external set_parameter_type : t -> string -> unit
  = "ml_g_action_entry_set_parameter_type"

external set_state : t -> string -> unit = "ml_g_action_entry_set_state"
external make : string -> string -> string -> t = "ml_g_action_entry_make"
