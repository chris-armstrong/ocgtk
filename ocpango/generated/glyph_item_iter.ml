class type glyph_item_iter_t = object
  method init_end : Raw.Glyph_item.t -> string -> bool
  (** Initializes a [PangoGlyphItemIter] structure to point to the last cluster
      in a glyph item.

      See [PangoGlyphItemIter] for details of cluster orders. *)

  method init_start : Raw.Glyph_item.t -> string -> bool
  (** Initializes a [PangoGlyphItemIter] structure to point to the first cluster
      in a glyph item.

      See [PangoGlyphItemIter] for details of cluster orders. *)

  method next_cluster : unit -> bool
  (** Advances the iterator to the next cluster in the glyph item.

      See [PangoGlyphItemIter] for details of cluster orders. *)

  method prev_cluster : unit -> bool
  (** Moves the iterator to the preceding cluster in the glyph item. See
      [PangoGlyphItemIter] for details of cluster orders. *)

  method as_glyph_item_iter : Raw.Glyph_item_iter.t
end

(* High-level class for GlyphItemIter *)
class glyph_item_iter (obj : Raw.Glyph_item_iter.t) : glyph_item_iter_t =
  object (self)
    method init_end : Raw.Glyph_item.t -> string -> bool =
      fun glyph_item text -> Raw.Glyph_item_iter.init_end obj glyph_item text

    method init_start : Raw.Glyph_item.t -> string -> bool =
      fun glyph_item text -> Raw.Glyph_item_iter.init_start obj glyph_item text

    method next_cluster : unit -> bool =
      fun () -> Raw.Glyph_item_iter.next_cluster obj

    method prev_cluster : unit -> bool =
      fun () -> Raw.Glyph_item_iter.prev_cluster obj

    method as_glyph_item_iter = obj
  end
