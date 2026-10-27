(** Does nothing.

    Its methods, signals and properties are on {!class-type-nothing_action_t}.
    The functions it is built on are in {!Ocgtk.Raw.Nothing_action}. *)

(** The methods, signals and properties of a [GtkNothingAction]. *)
class type nothing_action_t = object
  inherit Shortcut_action.shortcut_action_t
  method as_nothing_action : Raw.Nothing_action.t
end

class nothing_action : Raw.Nothing_action.t -> nothing_action_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Nothing_action.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [GtkNothingAction], give one already wrapped. *)
