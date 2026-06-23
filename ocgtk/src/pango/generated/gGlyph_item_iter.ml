class type glyph_item_iter_t = object
  method init_end : Glyph_item.t -> string -> bool
  method init_start : Glyph_item.t -> string -> bool
  method next_cluster : unit -> bool
  method prev_cluster : unit -> bool
  method get_glyph_item : Glyph_item.t
  method set_glyph_item : Glyph_item.t -> unit
  method get_text : string
  method set_text : string -> unit
  method get_start_glyph : int
  method set_start_glyph : int -> unit
  method get_start_index : int
  method set_start_index : int -> unit
  method get_start_char : int
  method set_start_char : int -> unit
  method get_end_glyph : int
  method set_end_glyph : int -> unit
  method get_end_index : int
  method set_end_index : int -> unit
  method get_end_char : int
  method set_end_char : int -> unit
  method as_glyph_item_iter : Glyph_item_iter.t
end

(* High-level class for GlyphItemIter *)
class glyph_item_iter (obj : Glyph_item_iter.t) : glyph_item_iter_t =
  object (self)
    method init_end : Glyph_item.t -> string -> bool =
      fun glyph_item text -> Glyph_item_iter.init_end obj glyph_item text

    method init_start : Glyph_item.t -> string -> bool =
      fun glyph_item text -> Glyph_item_iter.init_start obj glyph_item text

    method next_cluster : unit -> bool =
      fun () -> Glyph_item_iter.next_cluster obj

    method prev_cluster : unit -> bool =
      fun () -> Glyph_item_iter.prev_cluster obj

    method get_glyph_item : Glyph_item.t = Glyph_item_iter.get_glyph_item obj

    method set_glyph_item : Glyph_item.t -> unit =
      fun v -> Glyph_item_iter.set_glyph_item obj v

    method get_text : string = Glyph_item_iter.get_text obj
    method set_text : string -> unit = fun v -> Glyph_item_iter.set_text obj v
    method get_start_glyph : int = Glyph_item_iter.get_start_glyph obj

    method set_start_glyph : int -> unit =
      fun v -> Glyph_item_iter.set_start_glyph obj v

    method get_start_index : int = Glyph_item_iter.get_start_index obj

    method set_start_index : int -> unit =
      fun v -> Glyph_item_iter.set_start_index obj v

    method get_start_char : int = Glyph_item_iter.get_start_char obj

    method set_start_char : int -> unit =
      fun v -> Glyph_item_iter.set_start_char obj v

    method get_end_glyph : int = Glyph_item_iter.get_end_glyph obj

    method set_end_glyph : int -> unit =
      fun v -> Glyph_item_iter.set_end_glyph obj v

    method get_end_index : int = Glyph_item_iter.get_end_index obj

    method set_end_index : int -> unit =
      fun v -> Glyph_item_iter.set_end_index obj v

    method get_end_char : int = Glyph_item_iter.get_end_char obj

    method set_end_char : int -> unit =
      fun v -> Glyph_item_iter.set_end_char obj v

    method as_glyph_item_iter = obj
  end

let make (glyph_item : Glyph_item.t) (text : string) (start_glyph : int)
    (start_index : int) (start_char : int) (end_glyph : int) (end_index : int)
    (end_char : int) : glyph_item_iter_t =
  new glyph_item_iter
    (Glyph_item_iter.make glyph_item text start_glyph start_index start_char
       end_glyph end_index end_char)
