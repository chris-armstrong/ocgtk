class type item_t = object
  method apply_attrs : Attr_iterator.t -> unit
  method split : int -> int -> Item.t
  method as_item : Item.t
end

(* High-level class for Item *)
class item (obj : Item.t) : item_t =
  object (self)
    method apply_attrs : Attr_iterator.t -> unit =
      fun iter -> Item.apply_attrs obj iter

    method split : int -> int -> Item.t =
      fun split_index split_offset -> Item.split obj split_index split_offset

    method as_item = obj
  end

let new_ () : item_t = new item (Item.new_ ())
