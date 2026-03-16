(* High-level class for Item *)
class item (obj : Item.t) = object (self)

  method apply_attrs : Attr_iterator.t -> unit =
    fun iter ->
      (Item.apply_attrs obj iter)

  method copy : unit -> Item.t option =
    fun () ->
      (Item.copy obj)

  method free : unit -> unit =
    fun () ->
      (Item.free obj)

  method split : int -> int -> Item.t =
    fun split_index split_offset ->
      (Item.split obj split_index split_offset)

    method as_item = obj
end

