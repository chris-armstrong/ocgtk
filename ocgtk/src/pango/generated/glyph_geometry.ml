(* GENERATED CODE - DO NOT EDIT *)
(* GlyphGeometry: GlyphGeometry *)

type t = [ `glyph_geometry ] Gobject.obj
(** The `PangoGlyphGeometry` structure contains width and positioning
information for a single glyph.

Note that @width is not guaranteed to be the same as the glyph
extents. Kerning and other positioning applied during shaping will
affect both the @width and the @x_offset for the glyphs in the
glyph string that results from shaping.

The information in this struct is intended for rendering the glyphs,
as follows:

1. Assume the current point is (x, y)
2. Render the current glyph at (x + x_offset, y + y_offset),
3. Advance the current point to (x + width, y)
4. Render the next glyph *)

(* Methods *)

(* Record field accessors *)

(* Getters *)
external get_width : t -> unit = "ml_pango_glyph_geometry_get_width"
external get_x_offset : t -> unit = "ml_pango_glyph_geometry_get_x_offset"
external get_y_offset : t -> unit = "ml_pango_glyph_geometry_get_y_offset"

(* Setters *)
external set_width : t -> unit -> unit = "ml_pango_glyph_geometry_set_width"

external set_x_offset : t -> unit -> unit
  = "ml_pango_glyph_geometry_set_x_offset"

external set_y_offset : t -> unit -> unit
  = "ml_pango_glyph_geometry_set_y_offset"

external make : unit -> unit -> unit -> t = "ml_pango_glyph_geometry_make"
