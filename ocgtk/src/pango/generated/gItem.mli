class type item_t = object
  method apply_attrs : Attr_iterator.t -> unit
  method copy : unit -> Item.t option
  method free : unit -> unit
  method split : int -> int -> Item.t
  method as_item : Item.t
end

class item : Item.t -> item_t

val new_ : unit -> item_t
