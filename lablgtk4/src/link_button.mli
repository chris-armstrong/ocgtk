(* GENERATED CODE - DO NOT EDIT *)
(* Widget: LinkButton *)

type t = Gtk.Widget.t

(** Create a new LinkButton *)
external new_ : unit -> t = "ml_gtk_link_button_new"

(** Create a new LinkButton *)
external new_ : unit -> t = "ml_gtk_link_button_new_with_label"

(* Properties *)

(** Get property: uri *)
external get_uri : t -> unit = "ml_gtk_link_button_get_uri"

(** Set property: uri *)
external set_uri : t -> unit -> unit = "ml_gtk_link_button_set_uri"

(** Get property: visited *)
external get_visited : t -> bool = "ml_gtk_link_button_get_visited"

(** Set property: visited *)
external set_visited : t -> bool -> unit = "ml_gtk_link_button_set_visited"

