(* GENERATED CODE - DO NOT EDIT *)
(* Widget: IconPaintable *)

type t = Gtk.widget

(** Create a new IconPaintable *)
external new_for_file : unit -> int -> int -> t = "ml_gtk_icon_paintable_new_for_file"

(* Properties *)

(** Get property: icon-name *)
external get_icon_name : t -> string = "ml_gtk_icon_paintable_get_icon_name"

(** Get property: is-symbolic *)
external get_is_symbolic : t -> bool = "ml_gtk_icon_paintable_get_is_symbolic"

external is_symbolic : t -> bool = "ml_gtk_icon_paintable_is_symbolic"

