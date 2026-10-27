class type attr_list_t = object
  method change : Raw.Attribute.t -> unit
  method equal : Raw.Attr_list.t -> bool
  method get_attributes : unit -> Raw.Attribute.t list
  method get_iterator : unit -> Raw.Attr_iterator.t
  method insert : Raw.Attribute.t -> unit
  method insert_before : Raw.Attribute.t -> unit
  method ref : unit -> Raw.Attr_list.t
  method splice : Raw.Attr_list.t -> int -> int -> unit
  method to_string : unit -> string
  method update : int -> int -> int -> unit
  method as_attr_list : Raw.Attr_list.t
end

class attr_list : Raw.Attr_list.t -> attr_list_t

val new_ : unit -> attr_list_t
