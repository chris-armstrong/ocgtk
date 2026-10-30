(* GENERATED CODE - DO NOT EDIT *)
(* ActionEntry: ActionEntry *)

(** This struct defines a single action. It is for use with
    [Gio.ActionMap.add_action_entries].

    The order of the items in the structure are intended to reflect frequency of
    use. It is permissible to use an incomplete initialiser in order to leave
    some of the later values as [None]. All values after [name] are optional.
    Additional optional fields may be added in the future.

    See [Gio.ActionMap.add_action_entries] for an example.

    The class built on this module is in {!Ocgio.Action_entry}. *)

type t = [ `action_entry ] Gobject.obj

(* Methods *)
