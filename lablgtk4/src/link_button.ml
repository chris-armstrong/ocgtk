(* GENERATED CODE - DO NOT EDIT *)
(* Widget: LinkButton *)

type t = Gtk.Widget.t

external new_ : string -> t = "ml_gtk_link_button_new"

external new_with_label : string -> string option -> t = "ml_gtk_link_button_new_with_label"

(* Properties *)

external get_uri : t -> string = "ml_gtk_link_button_get_uri"

external set_uri : t -> string -> unit = "ml_gtk_link_button_set_uri"

external get_visited : t -> bool = "ml_gtk_link_button_get_visited"

external set_visited : t -> bool -> unit = "ml_gtk_link_button_set_visited"

