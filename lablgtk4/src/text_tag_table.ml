(* GENERATED CODE - DO NOT EDIT *)
(* Widget: TextTagTable *)

type t = Gtk.widget

external new_ : unit -> t = "ml_gtk_text_tag_table_new"

external remove : t -> Gtk.widget -> unit = "ml_gtk_text_tag_table_remove"

external lookup : t -> string -> Gtk.widget = "ml_gtk_text_tag_table_lookup"

external get_size : t -> int = "ml_gtk_text_tag_table_get_size"

external add : t -> Gtk.widget -> bool = "ml_gtk_text_tag_table_add"

