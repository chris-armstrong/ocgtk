class type item_t = object
  method apply_attrs : Attr_iterator.t -> unit
  method split : int -> int -> Item.t
  method get_offset : int
  method set_offset : int -> unit
  method get_length : int
  method set_length : int -> unit
  method get_num_chars : int
  method set_num_chars : int -> unit
  method get_analysis : Analysis.t
  method set_analysis : Analysis.t -> unit
  method as_item : Item.t
end

class item : Item.t -> item_t

val new_ : unit -> item_t
val make : int -> int -> int -> Analysis.t -> item_t
