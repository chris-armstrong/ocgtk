(* GENERATED CODE - DO NOT EDIT *)
(* CssLocation: CssLocation *)

type t = [ `css_location ] Gobject.obj

(* Methods *)

(* Record field accessors *)

(* Getters *)
external get_bytes : t -> Gsize.t = "ml_gtk_css_location_get_bytes"
external get_chars : t -> Gsize.t = "ml_gtk_css_location_get_chars"
external get_lines : t -> Gsize.t = "ml_gtk_css_location_get_lines"
external get_line_bytes : t -> Gsize.t = "ml_gtk_css_location_get_line_bytes"
external get_line_chars : t -> Gsize.t = "ml_gtk_css_location_get_line_chars"

(* Setters *)
external set_bytes : t -> Gsize.t -> unit = "ml_gtk_css_location_set_bytes"
external set_chars : t -> Gsize.t -> unit = "ml_gtk_css_location_set_chars"
external set_lines : t -> Gsize.t -> unit = "ml_gtk_css_location_set_lines"

external set_line_bytes : t -> Gsize.t -> unit
  = "ml_gtk_css_location_set_line_bytes"

external set_line_chars : t -> Gsize.t -> unit
  = "ml_gtk_css_location_set_line_chars"

external make : Gsize.t -> Gsize.t -> Gsize.t -> Gsize.t -> Gsize.t -> t
  = "ml_gtk_css_location_make"
