(* GENERATED CODE - DO NOT EDIT *)
(* Widget: ShortcutTrigger *)

type t = Gtk.Widget.t

(** Create a new ShortcutTrigger *)
external parse_string : string -> t = "ml_gtk_shortcut_trigger_parse_string"

external trigger : t -> _ Gdk.event -> bool -> Gdk.keymatch = "ml_gtk_shortcut_trigger_trigger"

external print_label : t -> unit -> unit -> bool = "ml_gtk_shortcut_trigger_print_label"

external print : t -> unit -> unit = "ml_gtk_shortcut_trigger_print"

external hash : t -> int = "ml_gtk_shortcut_trigger_hash"

external equal : t -> unit -> bool = "ml_gtk_shortcut_trigger_equal"

external compare : t -> unit -> int = "ml_gtk_shortcut_trigger_compare"

