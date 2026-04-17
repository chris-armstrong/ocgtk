class type attr_iterator_t = object
  method copy : unit -> Attr_iterator.t
  method destroy : unit -> unit
  method get : Pango_enums.attrtype -> Attribute.t option
  method get_attrs : unit -> Attribute.t list
  method next : unit -> bool
  method as_attr_iterator : Attr_iterator.t
end

class attr_iterator : Attr_iterator.t -> attr_iterator_t
