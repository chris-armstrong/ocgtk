(** Describes a keyboard shortcut.

    It contains a description of how to trigger the shortcut via a
    [Gtk.ShortcutTrigger] and a way to activate the shortcut on a widget via a
    [Gtk.ShortcutAction].

    The actual work is usually done via [Gtk.ShortcutController], which decides
    if and when to activate a shortcut. Using that controller directly however
    is rarely necessary as various higher level convenience APIs exist on
    [GtkWidget]s that make it easier to use shortcuts in GTK.

    [GtkShortcut] does provide functionality to make it easy for users to work
    with shortcuts, either by providing informational strings for display
    purposes or by allowing shortcuts to be configured.

    Its methods, signals and properties are on {!class-type-shortcut_t}. Its
    constructors are under {!section-constructors}. The functions it is built on
    are in {!Ocgtk.Raw.Shortcut}. *)

(** {b The methods, signals and properties of a [Shortcut].}

    Describes a keyboard shortcut.

    It contains a description of how to trigger the shortcut via a
    [Gtk.ShortcutTrigger] and a way to activate the shortcut on a widget via a
    [Gtk.ShortcutAction].

    The actual work is usually done via [Gtk.ShortcutController], which decides
    if and when to activate a shortcut. Using that controller directly however
    is rarely necessary as various higher level convenience APIs exist on
    [GtkWidget]s that make it easier to use shortcuts in GTK.

    [GtkShortcut] does provide functionality to make it easy for users to work
    with shortcuts, either by providing informational strings for display
    purposes or by allowing shortcuts to be configured. *)
class type shortcut_t = object
  method get_action : unit -> Shortcut_action.shortcut_action_t option
  (** Gets the action that is activated by this shortcut. *)

  method get_arguments : unit -> Gvariant.t option
  (** Gets the arguments that are passed when activating the shortcut. *)

  method get_trigger : unit -> Shortcut_trigger.shortcut_trigger_t option
  (** Gets the trigger used to trigger [self]. *)

  method set_action : Shortcut_action.shortcut_action_t option -> unit
  (** Sets the new action for [self] to be [action]. *)

  method set_arguments : Gvariant.t option -> unit
  (** Sets the arguments to pass when activating the shortcut. *)

  method set_trigger : Shortcut_trigger.shortcut_trigger_t option -> unit
  (** Sets the new trigger for [self] to be [trigger]. *)

  method as_shortcut : Raw.Shortcut.t
end

class shortcut : Raw.Shortcut.t -> shortcut_t
(** Wraps a raw handle of {!Ocgtk.Raw.Shortcut.t}. *)

(** {2:constructors Constructors} *)

val new_ :
  Shortcut_trigger.shortcut_trigger_t option ->
  Shortcut_action.shortcut_action_t option ->
  shortcut_t
(** Creates a new [GtkShortcut] that is triggered by [trigger] and then
    activates [action]. *)
