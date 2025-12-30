(* GENERATED CODE - DO NOT EDIT *)
(* ShortcutTrigger: ShortcutTrigger *)

type t = [`shortcut_trigger | `object_] Gobject.obj

(** Create a new ShortcutTrigger *)
external parse_string : string -> t = "ml_gtk_shortcut_trigger_parse_string"

(* Methods *)
(** Prints the given trigger into a human-readable string.

This is a small wrapper around [method@Gtk.ShortcutTrigger.print]
to help when debugging. *)
external to_string : t -> string = "ml_gtk_shortcut_trigger_to_string"

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

