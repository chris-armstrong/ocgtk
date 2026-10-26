class type item_t = object
  method apply_attrs : Raw.Attr_iterator.t -> unit
  method get_char_offset : unit -> int
  method split : int -> int -> Raw.Item.t
  method as_item : Raw.Item.t
end

(* High-level class for Item *)
class item (obj : Raw.Item.t) : item_t =
  object (self)
    method apply_attrs : Raw.Attr_iterator.t -> unit =
      fun iter -> Raw.Item.apply_attrs obj iter

    method get_char_offset : unit -> int =
      fun () -> Raw.Item.get_char_offset obj

    method split : int -> int -> Raw.Item.t =
      fun split_index split_offset ->
        Raw.Item.split obj split_index split_offset

    method as_item = obj
  end

let new_ () : item_t = new item (Raw.Item.new_ ())
