(* GENERATED CODE - DO NOT EDIT *)
(* ShortcutTrigger: ShortcutTrigger *)

type t = [`shortcut_trigger | `object_] Gobject.obj

(** Create a new ShortcutTrigger *)
external parse_string : string -> t = "ml_gtk_shortcut_trigger_parse_string"

(* Methods *)
(** Checks if the given @event triggers @self. *)
external trigger : t -> Ocgtk_gdk.Gdk.Wrappers.Event.t -> bool -> Ocgtk_gdk.Gdk.keymatch = "ml_gtk_shortcut_trigger_trigger"

(** Prints the given trigger into a human-readable string.

This is a small wrapper around [method@Gtk.ShortcutTrigger.print]
to help when debugging. *)
external to_string : t -> string = "ml_gtk_shortcut_trigger_to_string"

(** Gets textual representation for the given trigger.

This function is returning a translated string for
presentation to end users for example in menu items
or in help texts.

The @display in use may influence the resulting string in
various forms, such as resolving hardware keycodes or by
causing display-specific modifier names.

The form of the representation may change at any time and is
not guaranteed to stay identical. *)
external to_label : t -> Ocgtk_gdk.Gdk.Wrappers.Display.t -> string = "ml_gtk_shortcut_trigger_to_label"

(** Generates a hash value for a `GtkShortcutTrigger`.

The output of this function is guaranteed to be the same for a given
value only per-process. It may change between different processor
architectures or even different versions of GTK. Do not use this
function as a basis for building protocols or file formats.

The types of @trigger is `gconstpointer` only to allow use of this
function with `GHashTable`. They must each be a `GtkShortcutTrigger`. *)
external hash : t -> int = "ml_gtk_shortcut_trigger_hash"

(** Checks if @trigger1 and @trigger2 trigger under the same conditions.

The types of @one and @two are `gconstpointer` only to allow use of this
function with `GHashTable`. They must each be a `GtkShortcutTrigger`. *)
external equal : t -> t -> bool = "ml_gtk_shortcut_trigger_equal"

(** The types of @trigger1 and @trigger2 are `gconstpointer` only to allow
use of this function as a `GCompareFunc`.

They must each be a `GtkShortcutTrigger`. *)
external compare : t -> t -> int = "ml_gtk_shortcut_trigger_compare"

