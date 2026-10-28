(** This struct defines a single action. It is for use with
    [Gio.ActionMap.add_action_entries].

    Its methods, signals and properties are on {!class-type-action_entry_t}. Its
    full description is under {!section-description}. The functions it is built
    on are in {!Ocgio.Raw.Action_entry}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [ActionEntry].}

    This struct defines a single action. It is for use with
    [Gio.ActionMap.add_action_entries].

    The order of the items in the structure are intended to reflect frequency of
    use. It is permissible to use an incomplete initialiser in order to leave
    some of the later values as [NULL]. All values after [name] are optional.
    Additional optional fields may be added in the future.

    See [Gio.ActionMap.add_action_entries] for an example. *)
class type action_entry_t = object
  method as_action_entry : Raw.Action_entry.t
end

class action_entry : Raw.Action_entry.t -> action_entry_t
(** Wraps a raw handle of {!Ocgio.Raw.Action_entry.t}. *)

(** {1:description Description}

    This struct defines a single action. It is for use with
    [Gio.ActionMap.add_action_entries].

    The order of the items in the structure are intended to reflect frequency of
    use. It is permissible to use an incomplete initialiser in order to leave
    some of the later values as [NULL]. All values after [name] are optional.
    Additional optional fields may be added in the future.

    See [Gio.ActionMap.add_action_entries] for an example. *)
