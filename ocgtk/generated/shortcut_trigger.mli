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
  (** The types of [trigger1] and [trigger2] are [gconstpointer] only to allow
      use of this function as a [GCompareFunc].

      They must each be a [GtkShortcutTrigger]. *)

  method equal : shortcut_trigger_t -> bool
  (** Checks if [trigger1] and [trigger2] trigger under the same conditions.

      The types of [one] and [two] are [gconstpointer] only to allow use of this
      function with [GHashTable]. They must each be a [GtkShortcutTrigger]. *)

  method hash : unit -> int
  (** Generates a hash value for a [GtkShortcutTrigger].

      The output of this function is guaranteed to be the same for a given value
      only per-process. It may change between different processor architectures
      or even different versions of GTK. Do not use this function as a basis for
      building protocols or file formats.

      The types of [trigger] is [gconstpointer] only to allow use of this
      function with [GHashTable]. They must each be a [GtkShortcutTrigger]. *)

  method to_label : Ocgdk.Display.display_t -> string
  (** Gets textual representation for the given trigger.

      This function is returning a translated string for presentation to end
      users for example in menu items or in help texts.

      The [display] in use may influence the resulting string in various forms,
      such as resolving hardware keycodes or by causing display-specific
      modifier names.

      The form of the representation may change at any time and is not
      guaranteed to stay identical. *)

  method to_string : unit -> string
  (** Prints the given trigger into a human-readable string.

      This is a small wrapper around [Gtk.ShortcutTrigger.print] to help when
      debugging. *)

  method trigger : Ocgdk.Event.event_t -> bool -> Ocgdk.Enums.keymatch
  (** Checks if the given [event] triggers [self]. *)

  method as_shortcut_trigger : Raw.Shortcut_trigger.t
end

class shortcut_trigger : Raw.Shortcut_trigger.t -> shortcut_trigger_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Shortcut_trigger.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [GtkShortcutTrigger], give one already wrapped. *)

val parse_string : string -> shortcut_trigger_t
