(* GENERATED CODE - DO NOT EDIT *)
(* Widget: ShortcutTrigger *)

type t = Gtk.widget

external parse_string : string -> t = "ml_gtk_shortcut_trigger_parse_string"

external trigger : t -> _ Gdk.event -> bool -> Gdk.keymatch = "ml_gtk_shortcut_trigger_trigger"

external hash : t -> int = "ml_gtk_shortcut_trigger_hash"

