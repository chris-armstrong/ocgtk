(** Tracks how a [GtkShortcut] can be activated.

    To find out if a [GtkShortcutTrigger] triggers, you can call
    [Gtk.ShortcutTrigger.trigger] on a [GdkEvent].

    [GtkShortcutTriggers] contain functions that allow easy presentation to end
    users as well as being printed for debugging.

    All [GtkShortcutTriggers] are immutable, you can only specify their
    properties during construction. If you want to change a trigger, you have to
    replace it with a new one.

    Its methods, signals and properties are on {!class-type-shortcut_trigger_t}.
    The functions it is built on are in {!Ocgtk.Raw.Shortcut_trigger}. *)

(** The methods, signals and properties of a [GtkShortcutTrigger]. *)
class type shortcut_trigger_t = object
  method compare : shortcut_trigger_t -> int
  method equal : shortcut_trigger_t -> bool
  method hash : unit -> int
  method to_label : Ocgdk.Display.display_t -> string
  method to_string : unit -> string
  method trigger : Ocgdk.Event.event_t -> bool -> Ocgdk.Enums.keymatch
  method as_shortcut_trigger : Raw.Shortcut_trigger.t
end

class shortcut_trigger : Raw.Shortcut_trigger.t -> shortcut_trigger_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Shortcut_trigger.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [GtkShortcutTrigger], give one already wrapped. *)

val parse_string : string -> shortcut_trigger_t
