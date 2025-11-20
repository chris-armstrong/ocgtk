(* GENERATED CODE - DO NOT EDIT *)
(* Widget: ShortcutAction *)

type t = Gtk.Widget.t

(** Create a new ShortcutAction *)
external parse_string : string -> t = "ml_gtk_shortcut_action_parse_string"

external print : t -> unit -> unit = "ml_gtk_shortcut_action_print"

external activate : t -> Gtk_enums.shortcutactionflags -> Gtk.Widget.t -> unit -> bool = "ml_gtk_shortcut_action_activate"

