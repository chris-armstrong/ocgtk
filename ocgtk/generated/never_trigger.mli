(** A [GtkShortcutTrigger] that never triggers.

    Its methods, signals and properties are on {!class-type-never_trigger_t}.
    The functions it is built on are in {!Ocgtk.Raw.Never_trigger}. *)

(** The methods, signals and properties of a [NeverTrigger]. *)
class type never_trigger_t = object
  inherit Shortcut_trigger.shortcut_trigger_t
  method as_never_trigger : Raw.Never_trigger.t
end

class never_trigger : Raw.Never_trigger.t -> never_trigger_t
(** Wraps a raw handle of {!Ocgtk.Raw.Never_trigger.t}. *)
