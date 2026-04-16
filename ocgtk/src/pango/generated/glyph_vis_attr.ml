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
