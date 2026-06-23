(* GENERATED CODE - DO NOT EDIT *)
(* GlyphInfo: GlyphInfo *)

type t = [ `glyph_info ] Gobject.obj
(** A `PangoGlyphInfo` structure represents a single glyph with positioning
    information and visual attributes. *)

(* Methods *)

(* Record field accessors *)

(* Getters *)
external get_glyph : t -> unit = "ml_pango_glyph_info_get_glyph"

external get_geometry : t -> Glyph_geometry.t
  = "ml_pango_glyph_info_get_geometry"

external get_attr : t -> Glyph_vis_attr.t = "ml_pango_glyph_info_get_attr"

(* Setters *)
external set_glyph : t -> unit -> unit = "ml_pango_glyph_info_set_glyph"

external set_geometry : t -> Glyph_geometry.t -> unit
  = "ml_pango_glyph_info_set_geometry"

external set_attr : t -> Glyph_vis_attr.t -> unit
  = "ml_pango_glyph_info_set_attr"

external make : unit -> Glyph_geometry.t -> Glyph_vis_attr.t -> t
  = "ml_pango_glyph_info_make"
