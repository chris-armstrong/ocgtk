(** A [PangoGlyphVisAttr] structure communicates information between the shaping
    and rendering phases.

    Currently, it contains cluster start and color information. More attributes
    may be added in the future.

    Clusters are stored in visual order, within the cluster, glyphs are always
    ordered in logical order, since visual order is meaningless; that is, in
    Arabic text, accent glyphs follow the glyphs for the base character.

    Its methods, signals and properties are on {!class-type-glyph_vis_attr_t}.
    The functions it is built on are in {!Ocpango.Raw.Glyph_vis_attr}. *)

(** The methods, signals and properties of a [GlyphVisAttr]. *)
class type glyph_vis_attr_t = object
  method as_glyph_vis_attr : Raw.Glyph_vis_attr.t
end

class glyph_vis_attr : Raw.Glyph_vis_attr.t -> glyph_vis_attr_t
(** Wraps a raw handle of {!Ocpango.Raw.Glyph_vis_attr.t}. *)
