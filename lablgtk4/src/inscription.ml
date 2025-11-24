(* GENERATED CODE - DO NOT EDIT *)
(* Widget: Inscription *)

type t = Gtk.widget

external new_ : string option -> t = "ml_gtk_inscription_new"

(* Properties *)

external get_markup : t -> string = "ml_gtk_inscription_get_markup"

external set_markup : t -> string -> unit = "ml_gtk_inscription_set_markup"

external get_min_chars : t -> int = "ml_gtk_inscription_get_min_chars"

external set_min_chars : t -> int -> unit = "ml_gtk_inscription_set_min_chars"

external get_min_lines : t -> int = "ml_gtk_inscription_get_min_lines"

external set_min_lines : t -> int -> unit = "ml_gtk_inscription_set_min_lines"

external get_nat_chars : t -> int = "ml_gtk_inscription_get_nat_chars"

external set_nat_chars : t -> int -> unit = "ml_gtk_inscription_set_nat_chars"

external get_nat_lines : t -> int = "ml_gtk_inscription_get_nat_lines"

external set_nat_lines : t -> int -> unit = "ml_gtk_inscription_set_nat_lines"

external get_text : t -> string = "ml_gtk_inscription_get_text"

external set_text : t -> string -> unit = "ml_gtk_inscription_set_text"

external get_xalign : t -> float = "ml_gtk_inscription_get_xalign"

external set_xalign : t -> float -> unit = "ml_gtk_inscription_set_xalign"

external get_yalign : t -> float = "ml_gtk_inscription_get_yalign"

external set_yalign : t -> float -> unit = "ml_gtk_inscription_set_yalign"

external set_wrap_mode : t -> Pango.wrapmode -> unit = "ml_gtk_inscription_set_wrap_mode"

external set_text_overflow : t -> Gtk_enums.inscriptionoverflow -> unit = "ml_gtk_inscription_set_text_overflow"

external get_wrap_mode : t -> Pango.wrapmode = "ml_gtk_inscription_get_wrap_mode"

external get_text_overflow : t -> Gtk_enums.inscriptionoverflow = "ml_gtk_inscription_get_text_overflow"

