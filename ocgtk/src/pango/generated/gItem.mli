class item : Item.t ->
  object
    method apply_attrs : Attr_iterator.t -> unit
    method copy : unit -> Item.t option
    method free : unit -> unit
    method split : int -> int -> Item.t
    method as_item : Item.t
  end

