class type item_t = object
  method apply_attrs : Raw.Attr_iterator.t -> unit
  method get_char_offset : unit -> int
  method split : int -> int -> Raw.Item.t
  method as_item : Raw.Item.t
end

class item : Raw.Item.t -> item_t

val new_ : unit -> item_t
