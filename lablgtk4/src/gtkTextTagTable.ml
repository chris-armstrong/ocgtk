(* GENERATED CODE - DO NOT EDIT *)
(* Widget: TextTagTable - implementation *)

type t = Gtk.Widget.t

external new_ : unit -> t = "ml_gtk_text_tag_table_new"

external add : t -> Gtk.Widget.t -> unit = "ml_gtk_text_tag_table_add"
external remove : t -> Gtk.Widget.t -> unit = "ml_gtk_text_tag_table_remove"
external lookup : t -> string -> Gtk.Widget.t option = "ml_gtk_text_tag_table_lookup"
external get_size : t -> int = "ml_gtk_text_tag_table_get_size"
