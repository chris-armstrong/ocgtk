(* GENERATED CODE - DO NOT EDIT *)
(* Widget: DrawingArea *)

type t = Gtk.Widget.t

(** Create a new DrawingArea *)
external new_ : unit -> t = "ml_gtk_drawing_area_new"

(* Properties *)

(** Get property: content-height *)
external get_content_height : t -> int = "ml_gtk_drawing_area_get_content_height"

(** Set property: content-height *)
external set_content_height : t -> int -> unit = "ml_gtk_drawing_area_set_content_height"

(** Get property: content-width *)
external get_content_width : t -> int = "ml_gtk_drawing_area_get_content_width"

(** Set property: content-width *)
external set_content_width : t -> int -> unit = "ml_gtk_drawing_area_set_content_width"

external set_draw_func : t -> unit -> unit -> unit -> unit = "ml_gtk_drawing_area_set_draw_func"

