(* GENERATED CODE - DO NOT EDIT *)
(* Widget: Scale *)

type t = Gtk.Widget.t

(** Create a new Scale *)
external new_ : Gtk_enums.orientation -> Gtk.Widget.t option -> t = "ml_gtk_scale_new"

(** Create a new Scale *)
external new_with_range : Gtk_enums.orientation -> float -> float -> float -> t = "ml_gtk_scale_new_with_range"

(* Properties *)

(** Get property: digits *)
external get_digits : t -> int = "ml_gtk_scale_get_digits"

(** Set property: digits *)
external set_digits : t -> int -> unit = "ml_gtk_scale_set_digits"

(** Get property: draw-value *)
external get_draw_value : t -> bool = "ml_gtk_scale_get_draw_value"

(** Set property: draw-value *)
external set_draw_value : t -> bool -> unit = "ml_gtk_scale_set_draw_value"

(** Get property: has-origin *)
external get_has_origin : t -> bool = "ml_gtk_scale_get_has_origin"

(** Set property: has-origin *)
external set_has_origin : t -> bool -> unit = "ml_gtk_scale_set_has_origin"

external set_value_pos : t -> Gtk_enums.positiontype -> unit = "ml_gtk_scale_set_value_pos"

external get_value_pos : t -> Gtk_enums.positiontype = "ml_gtk_scale_get_value_pos"

external clear_marks : t -> unit = "ml_gtk_scale_clear_marks"

external add_mark : t -> float -> Gtk_enums.positiontype -> string option -> unit = "ml_gtk_scale_add_mark"

