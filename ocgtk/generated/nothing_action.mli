(** Does nothing.

    Its methods, signals and properties are on {!class-type-nothing_action_t}.
    The functions it is built on are in {!Ocgtk.Raw.Nothing_action}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [NothingAction].}

    Does nothing. *)
class type nothing_action_t = object
  inherit Shortcut_action.shortcut_action_t

  (** {2:conversions Conversions} *)

  method as_nothing_action : Raw.Nothing_action.t
end

class nothing_action : Raw.Nothing_action.t -> nothing_action_t
(** Wraps a raw handle of {!Ocgtk.Raw.Nothing_action.t}. *)
