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

(* High-level class for Item *)
class item (obj : Item.t) : item_t =
  object (self)
    method apply_attrs : Attr_iterator.t -> unit =
      fun iter -> Item.apply_attrs obj iter

    method split : int -> int -> Item.t =
      fun split_index split_offset -> Item.split obj split_index split_offset

    method get_offset : int = Item.get_offset obj
    method set_offset : int -> unit = fun v -> Item.set_offset obj v
    method get_length : int = Item.get_length obj
    method set_length : int -> unit = fun v -> Item.set_length obj v
    method get_num_chars : int = Item.get_num_chars obj
    method set_num_chars : int -> unit = fun v -> Item.set_num_chars obj v
    method get_analysis : Analysis.t = Item.get_analysis obj
    method set_analysis : Analysis.t -> unit = fun v -> Item.set_analysis obj v
    method as_item = obj
  end

let new_ () : item_t = new item (Item.new_ ())

let make (offset : int) (length : int) (num_chars : int) (analysis : Analysis.t)
    : item_t =
  new item (Item.make offset length num_chars analysis)
