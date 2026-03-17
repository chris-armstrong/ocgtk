(* GENERATED CODE - DO NOT EDIT *)
(* Font: Font *)

type t = [`font] Gobject.obj

(* Methods *)
(** Gets the `cairo_scaled_font_t` used by @font.
The scaled font can be referenced and kept using
cairo_scaled_font_reference(). *)
external get_scaled_font : t -> Ocgtk_cairo.Scaled_font.t option = "ml_pango_cairo_font_get_scaled_font"

