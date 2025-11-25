(* GENERATED CODE - DO NOT EDIT *)
(* Widget: ShortcutTrigger *)

type t = Gtk.widget

(** Create a new ShortcutTrigger *)
external parse_string : string -> t = "ml_gtk_shortcut_trigger_parse_string"

(** Checks if the given @event triggers @self. *)
external trigger : t -> _ Gdk.event -> bool -> Gdk.keymatch = "ml_gtk_shortcut_trigger_trigger"

(** Generates a hash value for a `GtkShortcutTrigger`.

The output of this function is guaranteed to be the same for a given
value only per-process. It may change between different processor
architectures or even different versions of GTK. Do not use this
function as a basis for building protocols or file formats.

The types of @trigger is `gconstpointer` only to allow use of this
function with `GHashTable`. They must each be a `GtkShortcutTrigger`. *)
external hash : t -> int = "ml_gtk_shortcut_trigger_hash"

