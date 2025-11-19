(* GENERATED CODE - DO NOT EDIT *)
(* Widget: Range *)

type t = Gtk.Widget.t

(* Properties *)

(** Get property: fill-level *)
external get_fill_level : t -> float = "ml_gtk_range_get_fill_level"

(** Set property: fill-level *)
external set_fill_level : t -> float -> unit = "ml_gtk_range_set_fill_level"

(** Get property: inverted *)
external get_inverted : t -> bool = "ml_gtk_range_get_inverted"

(** Set property: inverted *)
external set_inverted : t -> bool -> unit = "ml_gtk_range_set_inverted"

(** Get property: restrict-to-fill-level *)
external get_restrict_to_fill_level : t -> bool = "ml_gtk_range_get_restrict_to_fill_level"

(** Set property: restrict-to-fill-level *)
external set_restrict_to_fill_level : t -> bool -> unit = "ml_gtk_range_set_restrict_to_fill_level"

(** Get property: round-digits *)
external get_round_digits : t -> int = "ml_gtk_range_get_round_digits"

(** Set property: round-digits *)
external set_round_digits : t -> int -> unit = "ml_gtk_range_set_round_digits"

(** Get property: show-fill-level *)
external get_show_fill_level : t -> bool = "ml_gtk_range_get_show_fill_level"

(** Set property: show-fill-level *)
external set_show_fill_level : t -> bool -> unit = "ml_gtk_range_set_show_fill_level"

external set_value : t -> float -> unit = "ml_gtk_range_set_value"

external set_slider_size_fixed : t -> bool -> unit = "ml_gtk_range_set_slider_size_fixed"

external set_range : t -> float -> float -> unit = "ml_gtk_range_set_range"

external set_increments : t -> float -> float -> unit = "ml_gtk_range_set_increments"

external set_flippable : t -> bool -> unit = "ml_gtk_range_set_flippable"

external set_adjustment : t -> Gtk.Widget.t -> unit = "ml_gtk_range_set_adjustment"

external get_value : t -> float = "ml_gtk_range_get_value"

external get_slider_size_fixed : t -> bool = "ml_gtk_range_get_slider_size_fixed"

external get_slider_range : t -> int -> int -> unit = "ml_gtk_range_get_slider_range"

external get_range_rect : t -> unit -> unit = "ml_gtk_range_get_range_rect"

external get_flippable : t -> bool = "ml_gtk_range_get_flippable"

external get_adjustment : t -> Gtk.Widget.t = "ml_gtk_range_get_adjustment"

