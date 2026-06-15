(* GENERATED CODE - DO NOT EDIT *)
(* GlyphVisAttr: GlyphVisAttr *)

type t = [ `glyph_vis_attr ] Gobject.obj
(** A `PangoGlyphVisAttr` structure communicates information between the shaping
    and rendering phases.

    Currently, it contains cluster start and color information. More attributes
    may be added in the future.

    Clusters are stored in visual order, within the cluster, glyphs are always
    ordered in logical order, since visual order is meaningless; that is, in
    Arabic text, accent glyphs follow the glyphs for the base character. *)

(* Methods *)

(* Record field accessors *)

(* Getters *)
external get_is_cluster_start : t -> int
  = "ml_pango_glyph_vis_attr_get_is_cluster_start"

external get_is_color : t -> int = "ml_pango_glyph_vis_attr_get_is_color"

(* Setters *)
external set_is_cluster_start : t -> int -> unit
  = "ml_pango_glyph_vis_attr_set_is_cluster_start"

external set_is_color : t -> int -> unit
  = "ml_pango_glyph_vis_attr_set_is_color"

external make : int -> int -> t = "ml_pango_glyph_vis_attr_make"
