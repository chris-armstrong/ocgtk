(** A [GtkShortcutTrigger] that never triggers.

    Its methods, signals and properties are on {!class-type-never_trigger_t}.
    The functions it is built on are in {!Ocgtk.Raw.Never_trigger}. *)

(** The methods, signals and properties of a [GtkNeverTrigger]. *)
class type never_trigger_t = object
  inherit Shortcut_trigger.shortcut_trigger_t
  method as_never_trigger : Raw.Never_trigger.t
end

class never_trigger : Raw.Never_trigger.t -> never_trigger_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Never_trigger.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkNeverTrigger], give one already wrapped. *)
