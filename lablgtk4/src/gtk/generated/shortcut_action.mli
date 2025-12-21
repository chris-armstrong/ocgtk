(* GENERATED CODE - DO NOT EDIT *)
(* ShortcutAction: ShortcutAction *)

type t = [`shortcut_action | `object_] Gobject.obj

(** Create a new ShortcutAction *)
external parse_string : string -> t = "ml_gtk_shortcut_action_parse_string"

(* Methods *)
(** Prints the given action into a human-readable string.

This is a small wrapper around [method@Gtk.ShortcutAction.print]
to help when debugging. *)
external to_string : t -> string = "ml_gtk_shortcut_action_to_string"

