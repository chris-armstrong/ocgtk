class type attr_list_t = object
  method change : Attribute.t -> unit
  method equal : Attr_list.t -> bool
  method get_attributes : unit -> Attribute.t list
  method get_iterator : unit -> Attr_iterator.t
  method insert : Attribute.t -> unit
  method insert_before : Attribute.t -> unit
  method ref : unit -> Attr_list.t
  method splice : Attr_list.t -> int -> int -> unit
  method to_string : unit -> string
  method update : int -> int -> int -> unit
  method as_attr_list : Attr_list.t
end

class attr_list : Attr_list.t -> attr_list_t

val new_ : unit -> attr_list_t
