(* GENERATED CODE - DO NOT EDIT *)
(* Shortcut: Shortcut *)

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
    purposes or by allowing shortcuts to be configured. *)

type t = [ `shortcut | `object_ ] Gobject.obj

external new_ : Shortcut_trigger.t option -> Shortcut_action.t option -> t
  = "ml_gtk_shortcut_new"
(** Create a new Shortcut *)

(* Methods *)

external set_trigger : t -> Shortcut_trigger.t option -> unit
  = "ml_gtk_shortcut_set_trigger"
(** Sets the new trigger for [self] to be [trigger]. *)

external set_arguments : t -> Gvariant.t option -> unit
  = "ml_gtk_shortcut_set_arguments"
(** Sets the arguments to pass when activating the shortcut. *)

external set_action : t -> Shortcut_action.t option -> unit
  = "ml_gtk_shortcut_set_action"
(** Sets the new action for [self] to be [action]. *)

external get_trigger : t -> Shortcut_trigger.t option
  = "ml_gtk_shortcut_get_trigger"
(** Gets the trigger used to trigger [self]. *)

external get_arguments : t -> Gvariant.t option
  = "ml_gtk_shortcut_get_arguments"
(** Gets the arguments that are passed when activating the shortcut. *)

external get_action : t -> Shortcut_action.t option
  = "ml_gtk_shortcut_get_action"
(** Gets the action that is activated by this shortcut. *)

(* Properties *)
