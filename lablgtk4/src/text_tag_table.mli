(* GENERATED CODE - DO NOT EDIT *)
(* Widget: TextTagTable *)

type t = Gtk.Widget.t

(** Create a new TextTagTable *)
external new_ : unit -> t = "ml_gtk_text_tag_table_new"

external remove : t -> Gtk.Widget.t -> unit = "ml_gtk_text_tag_table_remove"

external lookup : t -> string -> Gtk.Widget.t = "ml_gtk_text_tag_table_lookup"

external get_size : t -> int = "ml_gtk_text_tag_table_get_size"

external foreach : t -> unit -> unit -> unit = "ml_gtk_text_tag_table_foreach"

external add : t -> Gtk.Widget.t -> bool = "ml_gtk_text_tag_table_add"

