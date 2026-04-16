class type glyph_item_iter_t = object
  method copy : unit -> Glyph_item_iter.t option
  method free : unit -> unit
  method init_end : Glyph_item.t -> string -> bool
  method init_start : Glyph_item.t -> string -> bool
  method next_cluster : unit -> bool
  method prev_cluster : unit -> bool
  method as_glyph_item_iter : Glyph_item_iter.t
end

(* High-level class for GlyphItemIter *)
class glyph_item_iter (obj : Glyph_item_iter.t) : glyph_item_iter_t =
  object (self)
    method copy : unit -> Glyph_item_iter.t option =
      fun () -> Glyph_item_iter.copy obj

    method free : unit -> unit = fun () -> Glyph_item_iter.free obj

    method init_end : Glyph_item.t -> string -> bool =
      fun glyph_item text -> Glyph_item_iter.init_end obj glyph_item text

    method init_start : Glyph_item.t -> string -> bool =
      fun glyph_item text -> Glyph_item_iter.init_start obj glyph_item text

    method next_cluster : unit -> bool =
      fun () -> Glyph_item_iter.next_cluster obj

    method prev_cluster : unit -> bool =
      fun () -> Glyph_item_iter.prev_cluster obj

    method as_glyph_item_iter = obj
  end
