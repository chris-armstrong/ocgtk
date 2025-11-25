(* GENERATED CODE - DO NOT EDIT *)
(* Widget: EmojiChooser *)

type t = [`emoji_chooser | `popover | `widget] Gobject.obj

val as_widget : t -> Gtk.widget

(** Create a new EmojiChooser *)
external new_ : unit -> t = "ml_gtk_emoji_chooser_new"

