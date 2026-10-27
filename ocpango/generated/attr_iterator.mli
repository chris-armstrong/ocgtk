class type attr_iterator_t = object
  method destroy : unit -> unit
  method get : Enums.attrtype -> Raw.Attribute.t option
  method get_attrs : unit -> Raw.Attribute.t list
  method next : unit -> bool
  method as_attr_iterator : Raw.Attr_iterator.t
end

class attr_iterator : Raw.Attr_iterator.t -> attr_iterator_t
